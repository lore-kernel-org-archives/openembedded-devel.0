Return-Path: <markku.degerholm@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7FECDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 10:36:20 +0000 (UTC)
Subject: Re: [meta-python][kirkstone][PATCH 1/1] python3-gevent: fix CVE-2023-41419
To: openembedded-devel@lists.openembedded.org
From: markku.degerholm@vaisala.com
X-Originating-Location: Vantaa, Uusimaa, FI (193.143.230.131)
X-Originating-Platform: Windows Chrome 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 03:36:17 -0700
References: <20231006141349.887405-1-narpat.mali@windriver.com>
In-Reply-To: <20231006141349.887405-1-narpat.mali@windriver.com>
Message-ID: <6763.1698057377571807424@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="PyikDaH6rn3IYDAllc3u"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 10:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105686

--PyikDaH6rn3IYDAllc3u
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the CVE fix, however we have detected that is has caused a regre=
ssion resulting in non-importable Python module `gevent.pywsgi`.

The regression is caused by this commit on `meta-openembedded`:

6432fee6d python3-gevent: fix CVE-2023-41419

The change is introduced here on the mailing list:

https://lists.openembedded.org/g/openembedded-devel/message/105369?p=3D%2C%=
2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cpython3-gevent%2C20%2C2%2C0%2C101798=
168

And brought to `kirkstone` release here:

https://lists.openembedded.org/g/openembedded-devel/message/105626?p=3D%2C%=
2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cpython3-gevent%2C20%2C2%2C0%2C102106=
531

When running on our embedded device, the symptoms are:

Python 3.10.13 (main, Aug 24 2023, 12:59:26) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import gevent.pywsgi
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib/python3.10/site-packages/gevent/pywsgi.py", line 1119
except socket.error
^
SyntaxError: expected ':'

This is because the patch states

+@@ -1000,14 +1110,28 @@ class WSGIHandler(object):
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.wsgi_input._discard()
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (socket.er=
ror, IOError):
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # D=
on't let exceptions during discarding
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except _InvalidCl=
ientInput:
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # T=
his one is deliberately raised to the outer
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # s=
cope, because, with the incoming stream in some bad state,
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # w=
e can't be sure we can synchronize and properly parse the next
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # r=
equest.
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rai=
se
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except socket.err=
or
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # D=
on't let socket exceptions during discarding
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# input override any exception that may have been
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# raised by the application, such as our own _InvalidClientInput.
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# In the general case, these aren't even worth logging (see the comment
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# just below)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pass

which causes a Python syntax violation on line `except socket.error` due to=
 a missing colon.

Kind regards,
Markku

--PyikDaH6rn3IYDAllc3u
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>Thanks for the CVE fix, however we have detected that is has caused a =
regression resulting in non-importable Python module `gevent.pywsgi`.</div>
<div>&nbsp;</div>
<div>The regression is caused by this commit on `meta-openembedded`:</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; 6432fee6d python3-gevent: fix CVE-2023-41419</div>
<div>&nbsp;</div>
<div>The change is introduced here on the mailing list:</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; https://lists.openembedded.org/g/openembedded-devel/mess=
age/105369?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cpython3-gevent%2C=
20%2C2%2C0%2C101798168</div>
<div>&nbsp;</div>
<div>And brought to `kirkstone` release here:</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; https://lists.openembedded.org/g/openembedded-devel/mess=
age/105626?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cpython3-gevent%2C=
20%2C2%2C0%2C102106531</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>When running on our embedded device, the symptoms are:</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; Python 3.10.13 (main, Aug 24 2023, 12:59:26) [GCC 11.4.0=
] on linux</div>
<div>&nbsp; &nbsp; Type "help", "copyright", "credits" or "license" for mor=
e information.</div>
<div>&nbsp; &nbsp; &gt;&gt;&gt; import gevent.pywsgi</div>
<div>&nbsp; &nbsp; Traceback (most recent call last):</div>
<div>&nbsp; &nbsp; &nbsp; File "&lt;stdin&gt;", line 1, in &lt;module&gt;</=
div>
<div>&nbsp; &nbsp; &nbsp; File "/usr/lib/python3.10/site-packages/gevent/py=
wsgi.py", line 1119</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; except socket.error</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;^</div>
<div>&nbsp; &nbsp; SyntaxError: expected ':'</div>
<div>&nbsp;</div>
<div>This is because the patch states</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; +@@ -1000,14 +1110,28 @@ class WSGIHandler(object):</div=
>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;finally=
:</div>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;try:</div>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;self.wsgi_input._discard()</div>
<div>&nbsp; &nbsp; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; except (socket.error, IOError):</div>
<div>&nbsp; &nbsp; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; # Don't let exceptions during discarding</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; except _InvalidClientInput:</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; # This one is deliberately raised to the outer</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; # scope, because, with the incoming stream in some bad stat=
e,</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; # we can't be sure we can synchronize and properly parse th=
e next</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; # request.</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; raise</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; except socket.error</div>
<div>&nbsp; &nbsp; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; # Don't let socket exceptions during discarding</div>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;# input override any exception that may have been</div=
>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;# raised by the application, such as our own _InvalidC=
lientInput.</div>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;# In the general case, these aren't even worth logging=
 (see the comment</div>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;# just below)</div>
<div>&nbsp; &nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;pass</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>which causes a Python syntax violation on line `except socket.error` d=
ue to a missing colon.</div>
<div>&nbsp;</div>
<div>Kind regards,&nbsp;</div>
<div>&nbsp;Markku</div>
<div>&nbsp;</div>

--PyikDaH6rn3IYDAllc3u--

