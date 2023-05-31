Return-Path: <david.antliff@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6532C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:57:40 +0000 (UTC)
Subject: Bitbake error when parsing OE ostree recipe - incorrectly escaped characters?
To: openembedded-devel@lists.openembedded.org
From: david.antliff@gmail.com
X-Originating-Location: Clovelly, New South Wales, AU (129.94.116.150)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 May 2023 23:57:33 -0700
Message-ID: <jvi8.1685516253699761409.9Zb2@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="b6xaCYTkaEqZ6jwmZr7Q"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 06:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102904

--b6xaCYTkaEqZ6jwmZr7Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have a strange issue with the meta-openembedded/meta-oe/recipes-extended/=
ostree/ostree_2022.5.bb recipe:

$ bitbake -b ostree -c clean
...
WARNING: Exception during build_dependencies for oe_runconf
WARNING: Error during finalise of [snip]/meta-openembedded/meta-oe/recipes-=
extended/ostree/ostree_2022.5.bb
ERROR: Command execution failed: Traceback (most recent call last):
=C2=A0 File "[snip]/poky/bitbake/lib/bb/pysh/pyshlex.py", line 172, in _par=
se_squote
=C2=A0=C2=A0=C2=A0 pos =3D buf.index("'")
ValueError: "'" is not in list This causes bitbake to crash whenever it tri=
es to parse all recipes, e.g. during `bitbake -g`. I'm not specifically usi=
ng this recipe, so it doesn't break my usual build for some reason.

From what I've been able to narrow down, the problem is with the escaped si=
ngle-ticks around the parameters after `--with-static-compiler=3D` at line =
94 in the recipe:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extende=
d/ostree/ostree_2022.5.bb?h=3Dlangdale#n94

   ${@bb.utils.contains('PACKAGECONFIG', 'static', '--with-static-compiler=
=3D\'${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}\'', '', d)} \
"
My locale is LANG=3Den_US.UTF-8. Bitbake version is 2.2.0.

What external or environmental factor could be causing this issue? There mu=
st be something unusual about my set-up, as it doesn't seem to be affecting=
 anyone else.

--b6xaCYTkaEqZ6jwmZr7Q
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have a strange issue with the meta-openembedded/meta-oe/recipes-extended/=
ostree/ostree_2022.5.bb recipe:<br /><br />
<pre><code></code></pre>
<pre><span class=3D"s2"></span>$ bitbake -b ostree -c clean<br />...<br />W=
ARNING: Exception during build_dependencies for oe_runconf<br />WARNING: Er=
ror during finalise of [snip]/meta-openembedded/meta-oe/recipes-extended/os=
tree/ostree_2022.5.bb<br />ERROR: Command execution failed: Traceback (most=
 recent call last):<br />&nbsp; File "[snip]/poky/bitbake/lib/bb/pysh/pyshl=
ex.py", line 172, in _parse_squote<br />&nbsp;&nbsp;&nbsp; pos =3D buf.inde=
x("'")<br />ValueError: "'" is not in list</pre>
<pre><code></code></pre>
This causes bitbake to crash whenever it tries to parse <em>all</em> recipe=
s, e.g. during `bitbake -g`. I'm not specifically using this recipe, so it =
doesn't break my usual build for some reason.<br /><br />From what I've bee=
n able to narrow down, the problem is with the escaped single-ticks around =
the parameters after `--with-static-compiler=3D` at line 94 in the recipe:<=
br /><a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-oe=
/recipes-extended/ostree/ostree_2022.5.bb?h=3Dlangdale#n94" target=3D"_blan=
k" rel=3D"noopener">http://cgit.openembedded.org/meta-openembedded/tree/met=
a-oe/recipes-extended/ostree/ostree_2022.5.bb?h=3Dlangdale#n94</a><br /><br=
 />
<pre><code></code></pre>
<pre><span class=3D"s2">    ${@bb.utils.contains('PACKAGECONFIG', 'static',=
 '--with-static-compiler=3D\'${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}\'', '',=
 d)} \</span>
<span class=3D"s2">"</span></pre>
<pre><code></code></pre>
<br />My locale is LANG=3Den_US.UTF-8. Bitbake version is 2.2.0.<br /><br /=
>What external or environmental factor could be causing this issue? There m=
ust be something unusual about my set-up, as it doesn't seem to be affectin=
g anyone else.

--b6xaCYTkaEqZ6jwmZr7Q--

