Subject: Re: wireguard-module broken in dunfell
To: openembedded-devel@lists.openembedded.org
From: veilleux.cedric@gmail.com
X-Originating-Location: Saint-Constant, Quebec, CA (74.15.114.147)
X-Originating-Platform: Linux Chrome 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 Oct 2020 10:19:37 -0700
References: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
In-Reply-To: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
Message-ID: <10765.1602004777092046892@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cOZEAYwET4DH16M1XMku"

--cOZEAYwET4DH16M1XMku
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I had the same issue and could not figure out what broke the wireguard-modu=
le package.

I had to resort to bissecting changes in meta-yocto.

I finally isolated the change that breaks wireguard-module:

87c9d29635 package: get_package_mapping: avoid dependency mapping if renam=
ed package provides original name

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D87c9d296357638=
082f5a7131a87365285fc813c4

It seems the package renaming that wireguard-module does (PKG_${PN} =3D "k=
ernel-module-${MODULE_NAME}") no longer works after the above commit.

At this point I do not understand the change regarding renamed package nam=
es and dependencies enough to recommend the appropriate fix to wireguard-mo=
dule. I have been able to workaround the issue by renaming the package kern=
el-module-wireguard and thus avoiding the rename altogether.

--cOZEAYwET4DH16M1XMku
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I had the same issue and could not figure out what broke the wireguard-modu=
le package.<br /><br />I had to resort to bissecting changes in meta-yocto.=
<br /><br />I finally isolated the change that breaks wireguard-module:<br =
/><br />87c9d29635 package: get_package_mapping: avoid dependency mapping i=
f renamed package provides original name<br /><br /><a href=3D"http://git.y=
octoproject.org/cgit/cgit.cgi/poky/commit/?id=3D87c9d296357638082f5a7131a87=
365285fc813c4">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D=
87c9d296357638082f5a7131a87365285fc813c4</a><br /><br />It seems the packag=
e renaming that wireguard-module does (PKG_${PN} =3D "kernel-module-${MODUL=
E_NAME}") no longer works after the above commit.<br /><br />At this point =
I do not understand the change regarding renamed package names and dependen=
cies enough to recommend the appropriate fix to wireguard-module. I have be=
en able to workaround the issue by renaming the package kernel-module-wireg=
uard and thus avoiding the rename altogether.

--cOZEAYwET4DH16M1XMku--
