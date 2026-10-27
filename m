Subject: Re: [meta-python][wrynose][PATCH 0/3] python3-aiohttp: fix multiple CVEs
To: openembedded-devel@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 156
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:28:13 -0700
References: <20261016064219.3910025-1-dkelaiya@cisco.com>
In-Reply-To: <20261016064219.3910025-1-dkelaiya@cisco.com>
Message-ID: <2948182.1793093293231559016@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="uzpU5T9Ms1BGIR4T8TuC"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131527

--uzpU5T9Ms1BGIR4T8TuC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Anuj,

I noticed that the aiohttp series has been picked up in your
anujm/wrynose contrib branch, but the prerequisite fix for
CVE-2026-54273 is missing.

As noted in the cover letter below, the series depends on that patch
for the HTTP parser queue-limit changes and recipe-time Cython
regeneration.

Could you please check the prerequisite patch [1] ( https://patchwork.yocto=
project.org/project/oe/patch/20260928174806.1818191-1-dkelaiya@cisco.com/ )=
 before this series?

[1] https://patchwork.yoctoproject.org/project/oe/patch/20260928174806.1818=
191-1-dkelaiya@cisco.com/

Thanks,
Darsh

On Fri, Oct 16, 2026 at 12:12 PM, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS =
PRIVATE LIMITED at Cisco) wrote:

>=20
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>=20
> Backport three upstream aiohttp security fixes to the 3.13.5 recipe
> on wrynose: CVE-2026-59881, CVE-2026-69243, and CVE-2026-69244.
>=20
> The series fixes WebSocket compression handling, rejected WebSocket
> upgrade request-body parsing, and bounded error messages in the C
> HTTP parser.
> The individual commits retain upstream fix and advisory references.
>=20
> This series depends on the previously submitted Wrynose fix for
> CVE-2026-54273, which has not merged yet. Apply that patch [1] before
> this series. It provides the HTTP parser queue-limit changes and
> recipe-time Cython regeneration used by these backports.
>=20
> [1] https://patchwork.yoctoproject.org/project/oe/patch/20260928174806.18=
18191-1-dkelaiya@cisco.com/
>=20
>=20
> Darsh Kelaiya (3):
> python3-aiohttp: fix CVE-2026-59881
> python3-aiohttp: fix CVE-2026-69243
> python3-aiohttp: fix CVE-2026-69244
>=20
> .../python3-aiohttp/CVE-2026-59881.patch | 103 ++++++
> .../python3-aiohttp/CVE-2026-69243.patch | 307 ++++++++++++++++++
> .../python3-aiohttp/CVE-2026-69244.patch | 159 +++++++++
> .../python/python3-aiohttp_3.13.5.bb | 3 +
> 4 files changed, 572 insertions(+)
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
>=20
> --
> 2.35.6

--uzpU5T9Ms1BGIR4T8TuC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Anuj,<br /><br /></div>
<div>
<p><span>I noticed that the aiohttp series has been picked up in your</span=
><br /><span>anujm/wrynose contrib branch, but the prerequisite fix for</sp=
an><br /><span>CVE-2026-54273 is missing.</span></p>
<p><span>As noted in the cover letter below, the series depends on that pat=
ch</span><br /><span>for the HTTP parser queue-limit changes and recipe-tim=
e Cython</span><br /><span>regeneration.</span></p>
<p><span>Could you please check the prerequisite patch [1]<a href=3D"https:=
//patchwork.yoctoproject.org/project/oe/patch/20260928174806.1818191-1-dkel=
aiya@cisco.com/" target=3D"_blank" rel=3D"noopener">&nbsp;</a></span><span>=
before this series?<br /><br />[1] <span><a href=3D"https://patchwork.yocto=
project.org/project/oe/patch/20260928174806.1818191-1-dkelaiya@cisco.com/" =
target=3D"_blank" rel=3D"noopener">https://patchwork.yoctoproject.org/proje=
ct/oe/patch/20260928174806.1818191-1-dkelaiya@cisco.com/</a><br /></span><b=
r /></span></p>
<p><span>Thanks,</span><br /><span>Darsh</span></p>
On Fri, Oct 16, 2026 at 12:12 PM, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS =
PRIVATE LIMITED at Cisco) wrote:</div>
<div>
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Backp=
ort three upstream aiohttp security fixes to the 3.13.5 recipe<br />on wryn=
ose: CVE-2026-59881, CVE-2026-69243, and CVE-2026-69244.<br /><br />The ser=
ies fixes WebSocket compression handling, rejected WebSocket<br />upgrade r=
equest-body parsing, and bounded error messages in the C<br />HTTP parser.<=
br />The individual commits retain upstream fix and advisory references.<br=
 /><br />This series depends on the previously submitted Wrynose fix for<br=
 />CVE-2026-54273, which has not merged yet. Apply that patch [1] before<br=
 />this series. It provides the HTTP parser queue-limit changes and<br />re=
cipe-time Cython regeneration used by these backports.<br /><br />[1] <a hr=
ef=3D"https://patchwork.yoctoproject.org/project/oe/patch/20260928174806.18=
18191-1-dkelaiya@cisco.com/" target=3D"_blank" rel=3D"noopener">https://pat=
chwork.yoctoproject.org/project/oe/patch/20260928174806.1818191-1-dkelaiya@=
cisco.com/</a><br /><br />Darsh Kelaiya (3):<br />python3-aiohttp: fix CVE-=
2026-59881<br />python3-aiohttp: fix CVE-2026-69243<br />python3-aiohttp: f=
ix CVE-2026-69244<br /><br />.../python3-aiohttp/CVE-2026-59881.patch | 103=
 ++++++<br />.../python3-aiohttp/CVE-2026-69243.patch | 307 +++++++++++++++=
+++<br />.../python3-aiohttp/CVE-2026-69244.patch | 159 +++++++++<br />.../=
python/python3-aiohttp_3.13.5.bb | 3 +<br />4 files changed, 572 insertions=
(+)<br />create mode 100644 meta-python/recipes-devtools/python/python3-aio=
http/CVE-2026-59881.patch<br />create mode 100644 meta-python/recipes-devto=
ols/python/python3-aiohttp/CVE-2026-69243.patch<br />create mode 100644 met=
a-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch<br />=
<br />-- <br />2.35.6</blockquote>
</div>

--uzpU5T9Ms1BGIR4T8TuC--
