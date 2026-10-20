Subject: Re: [meta-python][scarthgap][PATCH 00/13] python3-aiohttp: fix multiple CVEs
To: openembedded-devel@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 155
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 22:56:20 -0700
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
Message-ID: <2495981.1792475780320719427@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MnzTMouZ0eloWLWuQQLS"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131154

--MnzTMouZ0eloWLWuQQLS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Anuj, Khem,

Is there an update on the review, or anything you=E2=80=99d like me to chan=
ge in this series?

Thanks,
Darsh

On Mon, Sep 28, 2026 at 11:13 PM, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS =
PRIVATE LIMITED at Cisco) wrote:

>=20
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>=20
> Backport thirteen upstream aiohttp security fixes to the 3.9.5 recipe on
> scarthgap.
>=20
> The corresponding fixes are available in aiohttp 3.14.0 and 3.14.1.
> Carry them as focused backports instead of upgrading the recipe because
> the 3.14 release also introduces new APIs, deprecations, and
> backward-incompatible behavior outside the security scope.
>=20
> The individual commits retain the upstream fix provenance and public
> advisory references for each CVE.
>=20
> Testing:
> - Applied the thirteen layer commits to the upstream scarthgap baseline.
> - Applied all fifteen embedded patches to aiohttp 3.9.5 in series order
> with no conflicts or fuzz.
> - Package build and image build validation completed successfully.
>=20
> Darsh Kelaiya (13):
> python3-aiohttp: fix CVE-2026-34519
> python3-aiohttp: fix CVE-2026-34516
> python3-aiohttp: fix CVE-2026-34517
> python3-aiohttp: fix CVE-2026-34520
> python3-aiohttp: fix CVE-2026-34525
> python3-aiohttp: fix CVE-2026-47265
> python3-aiohttp: fix CVE-2026-50269
> python3-aiohttp: fix CVE-2026-54274
> python3-aiohttp: fix CVE-2026-54275
> python3-aiohttp: fix CVE-2026-54277
> python3-aiohttp: fix CVE-2026-54278
> python3-aiohttp: fix CVE-2026-54279
> python3-aiohttp: fix CVE-2026-54273
>=20
> .../python3-aiohttp/CVE-2026-34516.patch | 356 +++++++
> .../python3-aiohttp/CVE-2026-34517.patch | 65 ++
> .../python3-aiohttp/CVE-2026-34519.patch | 638 ++++++++++++
> .../python3-aiohttp/CVE-2026-34520.patch | 121 +++
> .../python3-aiohttp/CVE-2026-34525_p1.patch | 128 +++
> .../python3-aiohttp/CVE-2026-34525_p2.patch | 331 +++++++
> .../python3-aiohttp/CVE-2026-47265.patch | 61 ++
> .../python3-aiohttp/CVE-2026-50269.patch | 166 ++++
> .../python3-aiohttp/CVE-2026-54273_p1.patch | 798 ++++++++++++++++
> .../python3-aiohttp/CVE-2026-54273_p2.patch | 181 ++++
> .../python3-aiohttp/CVE-2026-54274.patch | 195 ++++
> .../python3-aiohttp/CVE-2026-54275.patch | 124 +++
> .../python3-aiohttp/CVE-2026-54277.patch | 96 ++
> .../python3-aiohttp/CVE-2026-54278.patch | 209 ++++
> .../python3-aiohttp/CVE-2026-54279.patch | 317 ++++++
> .../python/python3-aiohttp_3.9.5.bb | 15 +
> 16 files changed, 3801 insertions(+)
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34516.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.pat=
ch
>=20
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.pat=
ch
>=20
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.pat=
ch
>=20
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.pat=
ch
>=20
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
> create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
>=20
> --
> 2.35.6

--MnzTMouZ0eloWLWuQQLS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Anuj, Khem,<br /><br />Is there an update on the review, or anyt=
hing you&rsquo;d like me to change in this series?<br /><br />Thanks,<br />=
Darsh<br /><br />On Mon, Sep 28, 2026 at 11:13 PM, Darsh Kelaiya -X (dkelai=
ya - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:</div>
<div>
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Backp=
ort thirteen upstream aiohttp security fixes to the 3.9.5 recipe on<br />sc=
arthgap.<br /><br />The corresponding fixes are available in aiohttp 3.14.0=
 and 3.14.1.<br />Carry them as focused backports instead of upgrading the =
recipe because<br />the 3.14 release also introduces new APIs, deprecations=
, and<br />backward-incompatible behavior outside the security scope.<br />=
<br />The individual commits retain the upstream fix provenance and public<=
br />advisory references for each CVE.<br /><br />Testing:<br />- Applied t=
he thirteen layer commits to the upstream scarthgap baseline.<br />- Applie=
d all fifteen embedded patches to aiohttp 3.9.5 in series order<br />with n=
o conflicts or fuzz.<br />- Package build and image build validation comple=
ted successfully.<br /><br />Darsh Kelaiya (13):<br />python3-aiohttp: fix =
CVE-2026-34519<br />python3-aiohttp: fix CVE-2026-34516<br />python3-aiohtt=
p: fix CVE-2026-34517<br />python3-aiohttp: fix CVE-2026-34520<br />python3=
-aiohttp: fix CVE-2026-34525<br />python3-aiohttp: fix CVE-2026-47265<br />=
python3-aiohttp: fix CVE-2026-50269<br />python3-aiohttp: fix CVE-2026-5427=
4<br />python3-aiohttp: fix CVE-2026-54275<br />python3-aiohttp: fix CVE-20=
26-54277<br />python3-aiohttp: fix CVE-2026-54278<br />python3-aiohttp: fix=
 CVE-2026-54279<br />python3-aiohttp: fix CVE-2026-54273<br /><br />.../pyt=
hon3-aiohttp/CVE-2026-34516.patch | 356 +++++++<br />.../python3-aiohttp/CV=
E-2026-34517.patch | 65 ++<br />.../python3-aiohttp/CVE-2026-34519.patch | =
638 ++++++++++++<br />.../python3-aiohttp/CVE-2026-34520.patch | 121 +++<br=
 />.../python3-aiohttp/CVE-2026-34525_p1.patch | 128 +++<br />.../python3-a=
iohttp/CVE-2026-34525_p2.patch | 331 +++++++<br />.../python3-aiohttp/CVE-2=
026-47265.patch | 61 ++<br />.../python3-aiohttp/CVE-2026-50269.patch | 166=
 ++++<br />.../python3-aiohttp/CVE-2026-54273_p1.patch | 798 ++++++++++++++=
++<br />.../python3-aiohttp/CVE-2026-54273_p2.patch | 181 ++++<br />.../pyt=
hon3-aiohttp/CVE-2026-54274.patch | 195 ++++<br />.../python3-aiohttp/CVE-2=
026-54275.patch | 124 +++<br />.../python3-aiohttp/CVE-2026-54277.patch | 9=
6 ++<br />.../python3-aiohttp/CVE-2026-54278.patch | 209 ++++<br />.../pyth=
on3-aiohttp/CVE-2026-54279.patch | 317 ++++++<br />.../python/python3-aioht=
tp_3.9.5.bb | 15 +<br />16 files changed, 3801 insertions(+)<br />create mo=
de 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-3451=
6.patch<br />create mode 100644 meta-python/recipes-devtools/python/python3=
-aiohttp/CVE-2026-34517.patch<br />create mode 100644 meta-python/recipes-d=
evtools/python/python3-aiohttp/CVE-2026-34519.patch<br />create mode 100644=
 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch<b=
r />create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/=
CVE-2026-34525_p1.patch<br />create mode 100644 meta-python/recipes-devtool=
s/python/python3-aiohttp/CVE-2026-34525_p2.patch<br />create mode 100644 me=
ta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch<br /=
>create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE=
-2026-50269.patch<br />create mode 100644 meta-python/recipes-devtools/pyth=
on/python3-aiohttp/CVE-2026-54273_p1.patch<br />create mode 100644 meta-pyt=
hon/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch<br />cr=
eate mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-20=
26-54274.patch<br />create mode 100644 meta-python/recipes-devtools/python/=
python3-aiohttp/CVE-2026-54275.patch<br />create mode 100644 meta-python/re=
cipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch<br />create mode=
 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.=
patch<br />create mode 100644 meta-python/recipes-devtools/python/python3-a=
iohttp/CVE-2026-54279.patch<br /><br />-- <br />2.35.6</blockquote>
</div>

--MnzTMouZ0eloWLWuQQLS--
