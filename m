Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F3FE7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 09:15:02 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.9764.1733303694382601546
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 01:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fFhdm7vT;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e398273d6ffso4887078276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733303693; x=1733908493; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcpUASTfV+YwMYZ8oZFRKw8GAS81Kkcb903nbQj623Y=;
        b=fFhdm7vTo+JjN+Pr0VY87+/59U2BSeHZBsX67zkrWw3QLIj/uZEMbB+HAT+0OKt4RB
         USU+IUhRMVnwM0ylWVvt2+mnrp2JVXkx9kYT8/1r4ZAzxvEHeifZK06HNnLGqyQZHkcv
         4pHcu3rbhYRH04DYjqFDiuOv29HNz+eVZQDPNVLaMtXP4VEXEZzd9TnRcTfBg09Mf1c7
         ab+Bv6LdRchdptKwT7rkdJ17JXmNH+LmjFkzHzFBhjrxG8iwFbgJk5113olNbxwk65v0
         aLhCrsfZcTgQiM74XWLN5sSmxm7PeC6V1Uw6QOt+gID62E3UAQYQWmcU/Gyf/ehCzhD0
         mT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733303693; x=1733908493;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcpUASTfV+YwMYZ8oZFRKw8GAS81Kkcb903nbQj623Y=;
        b=Jzxqk0i17UmEm0FSYHRTZxg3rE/CDsMA15cKv6KYrnBod4eKvEX6jQP0koIgwaeaQB
         2CIYVbcr3MIx76DMtmebfZRyvT43hwmDahGpbTODBQEo+IQalN9LzKV7XW7RsJasc3tC
         aLeNY0DfacEBF6gtAQNYAyXaBHg/P3ZkduZ+MAlEVJPEiexaPp+E+hvG6UDPrVpc4WH3
         tPohGxaHtu1E7diGrb97or2YXlvx6xn6tz/6X6dcUIeBQD6m4EBw3geFyZaZNokDyXti
         83q/O1SpHP6T7gv7/MaV6oeNXtrF5N/u3RIOTWlaf1aqGeccMMz1oKLkuQ6rraYF8mCN
         /BYg==
X-Gm-Message-State: AOJu0Yz6sUa8YkQrs2AdBvgXG2DHucoSN3dSV66bQeBPHxaWaYJmszEr
	USNs/hc1mwVHuDGGJJZ+ivSNu1w4DUv5ebSDKFjGVPlCmdH6ZGEe4O0bl6x0dapMHlSxx9xTa0m
	8m/xBjebVs93+6V2YpbtQCDnOJN5nlg==
X-Gm-Gg: ASbGncvrGGHBtZHE+aAgkVIc8f5ML8wCcJMi/KWBPQK+Phyd45dP4pgMiixj6C29gby
	DcRhWiEcjGA7z+qEsBZl8cnnT+GnbKAwJ
X-Google-Smtp-Source: AGHT+IGhax9O9uOD9sKGwzXKADHv8Ue9UmJ/YSjMIoauky1wAJhfEq43RRCxON3ALan9e85SOmzEKI2m51sR3eQpilc=
X-Received: by 2002:a05:6902:1103:b0:e39:853b:822a with SMTP id
 3f1490d57ef6-e39d35ad7ebmr5079958276.0.1733303693225; Wed, 04 Dec 2024
 01:14:53 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0Hxn4YRVT1_8Vjzcv1Oqe_B7O6UHtEYyRzhKkH8OPq2pg@mail.gmail.com>
In-Reply-To: <CADySD0Hxn4YRVT1_8Vjzcv1Oqe_B7O6UHtEYyRzhKkH8OPq2pg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 4 Dec 2024 22:14:41 +1300
Message-ID: <CADySD0GaOXtoNvagju9h1_1b_h1bjMVijW3RyyO1ji3iX=2q8g@mail.gmail.com>
Subject: Trying to build image inside crops docker using github workflow
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec3ad506286e36e8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 09:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114196

--000000000000ec3ad506286e36e8
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to use github workflow to build core-image-minimal (scarthgap)
inside a docker container (ghcr.io/crops/poky:ubuntu-22.04)

Following is the workflow step:


steps:
- name: Start Yocto image build
shell: bash

run: |
echo "${{ secrets.TRACKER_TOKEN }}" | docker login ghcr.io -u ${{
github.actor }} --password-stdin
docker pull ghcr.io/crops/poky:ubuntu-22.04

cat << 'EOF' > script.sh
#!/bin/bash
echo "Running inside the Docker container"
git clone git://git.yoctoproject.org/poky -b scarthgap
source oe-init-build-env
bitbake core-image-minimal
EOF

chmod +x script.sh
docker run --rm -v $(pwd):/yocto --workdir=/workdir
ghcr.io/crops/poky:ubuntu-22.04 /bin/bash -c "source /workdir/script.sh"


But I am getting following error when this step runs:

WARNING: bitbake binary is not found in PATH, did you source the script?
ERROR: Execution of event handler 'defaultcheck_sanity_eventhandler' failed
Traceback (most recent call last):
File "/workdir/poky/meta/classes-global/sanity.bbclass", line 1025, in
defaultcheck_sanity_eventhandler(e=<bb.event.SanityCheck object at
0x7f7495a4cca0>, d=<bb.data_smart.DataSmart object at 0x7f74959d6a40>):
sanity_data = bb.data.createCopy(e.data)
> check_sanity(sanity_data)
if e.generateevents:
File "/workdir/poky/meta/classes-global/sanity.bbclass", line 996, in
check_sanity(sanity_data=<bb.data_smart.DataSmart object at
0x7f7495a4cf10>):
if last_sanity_version < sanity_version or last_nativelsbstr !=
nativelsbstr:
> check_sanity_version_change(status, sanity_data)
status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
File "/workdir/poky/meta/classes-global/sanity.bbclass", line 702, in
check_sanity_version_change(status=<SanityStatus object at 0x7f7495a4db10>,
d=<bb.data_smart.DataSmart object at 0x7f7495a4cf10>):
for bin_cmd in suid_check_bins:
> bin_path = bb.utils.which(os.environ["PATH"], bin_cmd)
if bin_path:
File "/usr/lib/python3.10/os.py", line 680, in
_Environ.__getitem__(key='PATH'):
# raise KeyError with the original key value
> raise KeyError(key) from None
return self.decodevalue(value)
KeyError: 'PATH'
ERROR: Command execution failed: Traceback (most recent call last):
File "/workdir/poky/bitbake/lib/bb/command.py", line 122, in
runAsyncCommand
self.cooker.updateCache()
File "/workdir/poky/bitbake/lib/bb/cooker.py", line 1606, in updateCache
bb.event.fire(bb.event.SanityCheck(False), self.databuilder.mcdata[mc])
File "/workdir/poky/bitbake/lib/bb/event.py", line 225, in fire
fire_class_handlers(event, d)
File "/workdir/poky/bitbake/lib/bb/event.py", line 132, in
fire_class_handlers
execute_handler(name, handler, event, d)
File "/workdir/poky/bitbake/lib/bb/event.py", line 103, in execute_handler
ret = handler(event, d)
File "/workdir/poky/meta/classes-global/sanity.bbclass", line 1025, in
defaultcheck_sanity_eventhandler
check_sanity(sanity_data)
File "/workdir/poky/meta/classes-global/sanity.bbclass", line 996, in
check_sanity
check_sanity_version_change(status, sanity_data)
File "/workdir/poky/meta/classes-global/sanity.bbclass", line 702, in
check_sanity_version_change
bin_path = bb.utils.which(os.environ["PATH"], bin_cmd)
File "/usr/lib/python3.10/os.py", line 680, in __getitem__
raise KeyError(key) from None
KeyError: 'PATH'
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

I have confirmed by adding "echo $PATH" before image starts that PATH
environment variable exists and bitbake is in the path:

/workdir/poky/scripts:/workdir/poky/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


But if I run the step as it is in my host machine, docker container is able
to build the image.

Any suggestions on what could be wrong here?

thanks
Ankur

--000000000000ec3ad506286e36e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Hello,<br><br>=
I am trying to use github workflow to build core-image-minimal (scarthgap) =
inside a docker container (<a href=3D"http://ghcr.io/crops/poky:ubuntu-22.0=
4" target=3D"_blank">ghcr.io/crops/poky:ubuntu-22.04</a>)<br><br>Following =
is the workflow step:<br><div><br></div><div><div style=3D"font-family:verd=
ana,sans-serif"><br></div><div style=3D"font-family:verdana,sans-serif"><sp=
an style=3D"font-family:verdana,sans-serif"><span class=3D"gmail_default" s=
tyle=3D"font-family:verdana,sans-serif"></span>steps:<br>- name: Start Yoct=
o image build<br>shell: bash<br><br>run: |<br>echo &quot;${{ secrets.TRACKE=
R_TOKEN }}&quot; | docker login <a href=3D"http://ghcr.io" target=3D"_blank=
">ghcr.io</a> -u ${{ github.actor }} --password-stdin<br>docker pull <a hre=
f=3D"http://ghcr.io/crops/poky:ubuntu-22.04" target=3D"_blank">ghcr.io/crop=
s/poky:ubuntu-22.04</a><br><br>cat &lt;&lt; &#39;EOF&#39; &gt; script.sh<br=
>#!/bin/bash<br>echo &quot;Running inside the Docker container&quot;<br>git=
 clone git://<a href=3D"http://git.yoctoproject.org/poky" target=3D"_blank"=
>git.yoctoproject.org/poky</a> -b scarthgap<br>source oe-init-build-env<br>=
bitbake c<span class=3D"gmail_default" style=3D"font-family:verdana,sans-se=
rif">ore-image-minimal</span><br>EOF<br><br>chmod +x script.sh<br>docker ru=
n --rm -v $(pwd):/<span class=3D"gmail_default" style=3D"font-family:verdan=
a,sans-serif">yocto</span> --workdir=3D/<span class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">workdir</span> <a href=3D"http://ghcr.i=
o/crops/poky:ubuntu-22.04" target=3D"_blank">ghcr.io/crops/poky:ubuntu-22.0=
4</a> /bin/bash -c &quot;source /<span class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">workdir</span>/script.sh&quot;<br></span></div=
><div style=3D"font-family:verdana,sans-serif"><br></div><br></div><span st=
yle=3D"font-family:verdana,sans-serif"><span class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif"></span></span>But I am getting followin=
g error when this step runs:</div><div dir=3D"ltr"><br><div><div style=3D"f=
ont-family:verdana,sans-serif"><div><div><div><span><span>WARNING: bitbake =
binary is not found in PATH, did you source the script?
</span></span>
  </div>
</div>
  </div><div>
    <div>
  <div>
    </div></div></div><div><div>
    <span><span>ERROR: Execution of event handler &#39;defaultcheck_sanity_=
eventhandler&#39; failed
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>Traceback (most recent call last):
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/meta/classes-global/sanity.bbcla=
ss&quot;, line 1025, in defaultcheck_sanity_eventhandler(e=3D&lt;bb.event.S=
anityCheck object at 0x7f7495a4cca0&gt;, d=3D&lt;bb.data_smart.DataSmart ob=
ject at 0x7f74959d6a40&gt;):
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>             sanity_data =3D bb.data.createCopy(e.data)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    &gt;        check_sanity(sanity_data)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>             if e.generateevents:
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/meta/classes-global/sanity.bbcla=
ss&quot;, line 996, in check_sanity(sanity_data=3D&lt;bb.data_smart.DataSma=
rt object at 0x7f7495a4cf10&gt;):
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>         if last_sanity_version &lt; sanity_version or last=
_nativelsbstr !=3D nativelsbstr:=20
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    &gt;        check_sanity_version_change(status, sanity_=
data)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>             status.addresult(check_sanity_sstate_dir_chang=
e(sstate_dir, sanity_data))
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/meta/classes-global/sanity.bbcla=
ss&quot;, line 702, in check_sanity_version_change(status=3D&lt;SanityStatu=
s object at 0x7f7495a4db10&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0=
x7f7495a4cf10&gt;):
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>         for bin_cmd in suid_check_bins:
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    &gt;        bin_path =3D bb.utils.which(os.environ[&quo=
t;PATH&quot;], bin_cmd)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>             if bin_path:
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/usr/lib/python3.10/os.py&quot;, line 680, in =
_Environ.__getitem__(key=3D&#39;PATH&#39;):
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>                 # raise KeyError with the original key val=
ue
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    &gt;            raise KeyError(key) from None
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>             return self.decodevalue(value)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>KeyError: &#39;PATH&#39;
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>ERROR: Command execution failed: Traceback (most recent cal=
l last):
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/bitbake/lib/bb/command.py&quot;,=
 line 122, in runAsyncCommand
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    self.cooker.updateCache()
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/bitbake/lib/bb/cooker.py&quot;, =
line 1606, in updateCache
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    bb.event.fire(bb.event.SanityCheck(False), self.databui=
lder.mcdata[mc])
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/bitbake/lib/bb/event.py&quot;, l=
ine 225, in fire
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    fire_class_handlers(event, d)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/bitbake/lib/bb/event.py&quot;, l=
ine 132, in fire_class_handlers
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    execute_handler(name, handler, event, d)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/bitbake/lib/bb/event.py&quot;, l=
ine 103, in execute_handler
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    ret =3D handler(event, d)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/meta/classes-global/sanity.bbcla=
ss&quot;, line 1025, in defaultcheck_sanity_eventhandler
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    check_sanity(sanity_data)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/workdir/poky/meta/classes-global/sanity.bbcla=
ss&quot;, line 996, in check_sanity
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    check_sanity_version_change(status, sanity_data)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div style=3D"height:auto"><div><div><div>
    <span><span>  File &quot;/workdir/poky/meta/classes-global/sanity.bbcla=
ss&quot;, line 702, in check_sanity_version_change
</span></span>
  </div>
</div>
  </div></div><div style=3D"height:auto"><div>
    <div>
  <div>
    </div></div></div></div><div><div>
    <span><span>    bin_path =3D bb.utils.which(os.environ[&quot;PATH&quot;=
], bin_cmd)
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>  File &quot;/usr/lib/python3.10/os.py&quot;, line 680, in =
__getitem__
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>    raise KeyError(key) from None
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>KeyError: &#39;PATH&#39;
</span></span>
  </div>
</div><div>
  <div>
    </div></div><div><div>
    <span><span>Summary: There was 1 WARNING message.
</span></span>
  </div>
</div><div>
  <div>
    </div></div>
    <span><span>Summary: There were 2 ERROR messages, returning a non-zero =
exit code.</span></span></div><div style=3D"font-family:verdana,sans-serif"=
><span><span><br></span></span></div><div style=3D"font-family:verdana,sans=
-serif"><span><span>I have confirmed by adding <span class=3D"gmail_default=
" style=3D"font-family:verdana,sans-serif">&quot;</span>echo $PATH<span cla=
ss=3D"gmail_default" style=3D"font-family:verdana,sans-serif">&quot;</span>=
 before image starts <span class=3D"gmail_default" style=3D"font-family:ver=
dana,sans-serif">that</span> PATH<span class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"> environment variable exists and bitbake is in=
 the path:<br></span></span></span></div><div style=3D"font-family:verdana,=
sans-serif"><span><span><br>/workdir/poky/scripts:/workdir/poky/bitbake/bin=
:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin</span></span>=
</div><div style=3D"font-family:verdana,sans-serif"><span><span><br></span>=
</span></div><div style=3D"font-family:verdana,sans-serif"><span><span><br>=
</span></span></div><div style=3D"font-family:verdana,sans-serif"><span><sp=
an>But if I run the step as it is in my host machine, docker container is a=
ble to build the image.</span></span></div><div style=3D"font-family:verdan=
a,sans-serif"><span><span><br></span></span></div><div style=3D"font-family=
:verdana,sans-serif"><span><span>Any suggestions on what could be wrong her=
e?</span></span></div><div style=3D"font-family:verdana,sans-serif"><span><=
span><br></span></span></div><div style=3D"font-family:verdana,sans-serif">=
<span><span>thanks</span></span></div><div style=3D"font-family:verdana,san=
s-serif"><span><span>Ankur<br></span></span></div><br></div></div>
</div></div>

--000000000000ec3ad506286e36e8--

