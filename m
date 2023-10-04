Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B3DE936EB
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 21:53:17 +0000 (UTC)
Subject: error when using devtool update-recipe linux-intel or devtool build linux-intel
To: openembedded-devel@lists.openembedded.org
From: "SIMON BABY" <simonkbaby@gmail.com>
X-Originating-Location: San Diego, California, US (130.50.200.1)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 04 Oct 2023 14:53:13 -0700
Message-ID: <G2x5.1696456393205730782.V3hq@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dRWdF3o9OctQyB5juujd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 21:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105344

--dRWdF3o9OctQyB5juujd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Team,

I am getting the below error all the time when I use devtool update-recipe =
or devtoiol build.

*Exception: bb.fetch2.FetchError: Fetcher failure: Recipe uses a floating t=
ag/branch '5.15/linux' for repo 'github.com/intel/linux-intel-lts.git' with=
out a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV=
 for OE).*

*ERROR: Parsing halted due to errors, see error messages above*

sbaby@ECP-WAP-APPSERVER:~/workspace/09252023/ecp-wap-appserver/build$ devto=
ol build linux-intel

NOTE: Starting bitbake server...

WARNING: Layer summit-radio should set LAYERSERIES_COMPAT_summit-radio in i=
ts conf/layer.conf file to list the core layer names it is compatible with.

NOTE: Reconnecting to bitbake server...

NOTE: Retrying server connection (#1)...

WARNING: Layer summit-radio should set LAYERSERIES_COMPAT_summit-radio in i=
ts conf/layer.conf file to list the core layer names it is compatible with.

Loading cache: 100% |######################################################=
###########################################################################=
###########################################| Time: 0:00:00

Loaded 4588 entries from dependency cache.

ERROR: /home/sbaby/workspace/09252023/ecp-wap-appserver/build/../iotg-yocto=
-ese-bsp/recipes-kernel/linux/linux-intel_5.15.bb: Error executing a python=
 function in <code>:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
ETA:=C2=A0 --:--:--

The stack trace of python calls that resulted in this exception/failure was=
:

File: '<code>', lineno: 19, function: <module>

0015:__anon_41__home_sbaby_workspace_09252023_ecp_wap_appserver_build____io=
tg_yocto_ese_bsp_classes_kernel_oot_mod_scripts_bbclass(d)

0016:__anon_22__home_sbaby_workspace_09252023_ecp_wap_appserver_build____po=
ky_meta_classes_image_artifact_names_bbclass(d)

0017:__anon_7__home_sbaby_workspace_09252023_ecp_wap_appserver_build____pok=
y_meta_classes_kernel_devicetree_bbclass(d)

0018:__anon_721__home_sbaby_workspace_09252023_ecp_wap_appserver_build____p=
oky_meta_classes_kernel_yocto_bbclass(d)

*** 0019:__anon_147__home_sbaby_workspace_09252023_ecp_wap_appserver_build_=
___poky_meta_classes_externalsrc_bbclass(d)

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/build/../poky/meta/=
classes/externalsrc.bbclass', lineno: 66, function: __anon_147__home_sbaby_=
workspace_09252023_ecp_wap_appserver_build____poky_meta_classes_externalsrc=
_bbclass

0062:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:

0063:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.s=
etVar('B', '${WORKDIR}/${BPN}-${PV}')

0064:

0065:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_srcuri =3D []

*** 0066:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch =3D bb.fetch2.Fet=
ch((d.getVar('SRC_URI') or '').split(), d)

0067:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for url in fetch.urls:

0068:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 url=
_data =3D fetch.ud[url]

0069:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 par=
m =3D url_data.parm

0070:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(url_data.type =3D=3D 'file' or

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/__init__.py', lineno: 1682, function: __init__

1678:

1679:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for url in urls:

1680:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
url not in self.ud:

1681:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 try:

*** 1682:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.ud[url] =3D FetchData=
(url, d, localonly)

1683:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 except NonLocalMethod:

1684:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if localonly:

1685:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.=
ud[url] =3D None

1686:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/__init__.py', lineno: 1319, function: __init__

1315:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log=
ger.warning('Consider updating %s recipe to use "protocol" not "proto" in S=
RC_URI.', d.getVar('PN'))

1316:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.parm["protocol"] =3D self.parm.get("proto", None)

1317:

1318:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if hasattr(self.method, "ur=
ldata_init"):

*** 1319:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.method.urldata_init(self, d)

1320:

1321:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "localpath" in self.parm=
:

1322:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # i=
f user sets localpath for file, use it instead.

1323:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.localpath =3D self.parm["localpath"]

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/git.py', lineno: 250, function: urldata_init

0246:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_tarballs =3D d.getVar=
("BB_GENERATE_MIRROR_TARBALLS") or "0"

0247:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.write_tarballs =3D write=
_tarballs !=3D "0" or ud.rebaseable

0248:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.write_shallow_tarballs =
=3D (d.getVar("BB_GENERATE_SHALLOW_TARBALLS") or write_tarballs) !=3D "0"

0249:

*** 0250:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.setup_revisions(d)

0251:

0252:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for name in ud.names:

0253:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # E=
nsure anything that doesn't look like a sha256 checksum/revision is transla=
ted into one

0254:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
not ud.revisions[name] or len(ud.revisions[name]) !=3D 40=C2=A0 or (False i=
n [c in "abcdef0123456789" for c in ud.revisions[name]]):

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/__init__.py', lineno: 1349, function: setup_revisions

1345:

1346:=C2=A0=C2=A0=C2=A0 def setup_revisions(self, d):

1347:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.revisions =3D {}

1348:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for name in self.names:

*** 1349:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.revisions[name] =3D srcrev_internal_helper(self, d, name)

1350:

1351:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # add compatibility code fo=
r non name specified case

1352:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if len(self.names) =3D=3D 1=
:

1353:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.revision =3D self.revisions[self.names[0]]

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/__init__.py', lineno: 1214, function: srcrev_internal_helper

1210:

1211:=C2=A0=C2=A0=C2=A0 if srcrev =3D=3D "INVALID" or not srcrev:

1212:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise FetchError("Please se=
t a valid SRCREV for url %s (possible key names are %s, or use a ;rev=3DX U=
RL parameter)" % (str(attempts), ud.url), ud.url)

1213:=C2=A0=C2=A0=C2=A0 if srcrev =3D=3D "AUTOINC":

*** 1214:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 srcrev =3D ud.method.la=
test_revision(ud, d, name)

1215:

1216:=C2=A0=C2=A0=C2=A0 return srcrev

1217:

1218:def get_checksum_file_list(d):

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/__init__.py', lineno: 1626, function: latest_revision

1622:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key =3D self.generate_revis=
ion_key(ud, d, name)

1623:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:

1624:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn revs[key]

1625:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:

*** 1626:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 revs[key] =3D rev =3D self._latest_revision(ud, d, name)

1627:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn rev

1628:

1629:=C2=A0=C2=A0=C2=A0 def sortable_revision(self, ud, d, name):

1630:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 latest_rev =3D self._build_=
revision(ud, d, name)

File: '/home/sbaby/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb=
/fetch2/git.py', lineno: 739, function: _latest_revision

0735:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """

0736:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compute the HEAD revision f=
or the url

0737:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """

0738:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not d.getVar("__BBSEENSR=
CREV"):

*** 0739:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 raise bb.fetch2.FetchError("Recipe uses a floating tag/branch '%s' for rep=
o '%s' without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use =
SRCPV in PV for OE)." % (ud.unresolvedrev[name], ud.host+ud.path))

0740:

0741:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Ensure we mark as not cac=
hed

0742:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fetch2.get_autorev(d)

0743:

Exception: bb.fetch2.FetchError: Fetcher failure: Recipe uses a floating ta=
g/branch '5.15/linux' for repo 'github.com/intel/linux-intel-lts.git' witho=
ut a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV =
for OE).

ERROR: Parsing halted due to errors, see error messages above

Summary: There was 1 WARNING message.

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Failed to start bitbake environment

Regards
Simon

--dRWdF3o9OctQyB5juujd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Team,<br/><br/>I am getting the below error all the time when I use d=
evtool update-recipe or devtoiol build.=C2=A0<br/><br/>
<p class=3D"DefangedMsoNormal" style=3D"line-height: 1.42857;" style=3D"mar=
gin:0px;"><strong>Exception: bb.fetch2.FetchError: Fetcher failure: Recipe =
uses a floating tag/branch &#39;5.15/linux&#39; for repo &#39;github.com/in=
tel/linux-intel-lts.git&#39; without a fixed SRCREV yet doesn&#39;t call bb=
.fetch2.get_srcrev() (use SRCPV in PV for OE).</strong></p>
<p class=3D"DefangedMsoNormal" style=3D"line-height: 1.42857;" style=3D"mar=
gin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"line-height: 1.42857;" style=3D"mar=
gin:0px;"><strong>ERROR: Parsing halted due to errors, see error messages a=
bove</strong></p>
<br/>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">sbaby@ECP-WAP-APPSERVE=
R:~/workspace/09252023/ecp-wap-appserver/build$ devtool build linux-intel</=
p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">NOTE: Starting bitbake=
 server...</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">WARNING: Layer summit-=
radio should set LAYERSERIES_COMPAT_summit-radio in its conf/layer.conf fil=
e to list the core layer names it is compatible with.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">NOTE: Reconnecting to =
bitbake server...</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">NOTE: Retrying server =
connection (#1)...</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">WARNING: Layer summit-=
radio should set LAYERSERIES_COMPAT_summit-radio in its conf/layer.conf fil=
e to list the core layer names it is compatible with.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Loading cache: 100% |#=
###########################################################################=
###########################################################################=
#####################| Time: 0:00:00</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Loaded 4588 entries fr=
om dependency cache.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">ERROR: /home/sbaby/wor=
kspace/09252023/ecp-wap-appserver/build/../iotg-yocto-ese-bsp/recipes-kerne=
l/linux/linux-intel_5.15.bb: Error executing a python function in &lt;code&=
gt;:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ETA:=C2=A0 --:-=
-:--</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">The stack trace of pyt=
hon calls that resulted in this exception/failure was:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;&lt;code&gt=
;&#39;, lineno: 19, function: &lt;module&gt;</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0015:__anon_41__home_sbaby_workspace_09252023_ecp_wap_appserver_build__=
__iotg_yocto_ese_bsp_classes_kernel_oot_mod_scripts_bbclass(d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0016:__anon_22__home_sbaby_workspace_09252023_ecp_wap_appserver_build__=
__poky_meta_classes_image_artifact_names_bbclass(d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0017:__anon_7__home_sbaby_workspace_09252023_ecp_wap_appserver_build___=
_poky_meta_classes_kernel_devicetree_bbclass(d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0018:__anon_721__home_sbaby_workspace_09252023_ecp_wap_appserver_build_=
___poky_meta_classes_kernel_yocto_bbclass(d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 0019:__anon_147__h=
ome_sbaby_workspace_09252023_ecp_wap_appserver_build____poky_meta_classes_e=
xternalsrc_bbclass(d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/build/../poky/meta/classes/externalsr=
c.bbclass&#39;, lineno: 66, function: __anon_147__home_sbaby_workspace_0925=
2023_ecp_wap_appserver_build____poky_meta_classes_externalsrc_bbclass</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0062:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0063:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 d.setVar(&#39;B&#39;, &#39;${WORKDIR}/${BPN}-${PV}&#39;)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0064:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0065:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_srcuri =3D []</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 0066:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch =3D bb.fetch2.Fetch((d.getVar(&#39;SRC=
_URI&#39;) or &#39;&#39;).split(), d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0067:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for url in fetch.urls:<=
/p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0068:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 url_data =3D fetch.ud[url]</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0069:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 parm =3D url_data.parm</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0070:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (url_data.type =3D=3D &#39;file&#39; or</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/__init__.p=
y&#39;, lineno: 1682, function: __init__</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1678:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1679:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for url in urls:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1680:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if url not in self.ud:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1681:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 try:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 1682:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.ud[url] =3D FetchData(url, d, localonly)</=
p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1683:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 except NonLocalMethod:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1684:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if localonly:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1685:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.ud[url] =3D None</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1686:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa=
ss</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/__init__.p=
y&#39;, lineno: 1319, function: __init__</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1315:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 logger.warning(&#39;Consider updating %s recipe to use &#34;protocol&#34; =
not &#34;proto&#34; in SRC_URI.&#39;, d.getVar(&#39;PN&#39;))</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1316:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.parm[&#34;protocol&#34;] =3D self.parm.get(&#34;proto&#34;, None)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1317:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1318:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if hasattr(self.method,=
 &#34;urldata_init&#34;):</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 1319:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.method.urldata_=
init(self, d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1320:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1321:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if &#34;localpath&#34; =
in self.parm:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1322:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 # if user sets localpath for file, use it instead.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1323:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.localpath =3D self.parm[&#34;localpath&#34;]</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/git.py&#39=
;, lineno: 250, function: urldata_init</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0246:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_tarballs =3D d.ge=
tVar(&#34;BB_GENERATE_MIRROR_TARBALLS&#34;) or &#34;0&#34;</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0247:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.write_tarballs =3D w=
rite_tarballs !=3D &#34;0&#34; or ud.rebaseable</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0248:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.write_shallow_tarbal=
ls =3D (d.getVar(&#34;BB_GENERATE_SHALLOW_TARBALLS&#34;) or write_tarballs)=
 !=3D &#34;0&#34;</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0249:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 0250:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.setup_revisions(d)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0251:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0252:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for name in ud.names:</=
p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0253:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 # Ensure anything that doesn&#39;t look like a sha256 checksum/revision is=
 translated into one</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0254:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if not ud.revisions[name] or len(ud.revisions[name]) !=3D 40=C2=A0 or (Fal=
se in [c in &#34;abcdef0123456789&#34; for c in ud.revisions[name]]):</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/__init__.p=
y&#39;, lineno: 1349, function: setup_revisions</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1345:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1346:=C2=A0=C2=A0=C2=A0 def setup_revisions(self, d):</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1347:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.revisions =3D {}</=
p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1348:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for name in self.names:=
</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 1349:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.revisions[name]=
 =3D srcrev_internal_helper(self, d, name)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1350:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1351:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # add compatibility cod=
e for non name specified case</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1352:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if len(self.names) =3D=
=3D 1:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1353:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.revision =3D self.revisions[self.names[0]]</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/__init__.p=
y&#39;, lineno: 1214, function: srcrev_internal_helper</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1210:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1211:=C2=A0=C2=A0=C2=A0 if srcrev =3D=3D &#34;INVALID&#34; or not srcre=
v:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1212:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise FetchError(&#34;P=
lease set a valid SRCREV for url %s (possible key names are %s, or use a ;r=
ev=3DX URL parameter)&#34; % (str(attempts), ud.url), ud.url)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1213:=C2=A0=C2=A0=C2=A0 if srcrev =3D=3D &#34;AUTOINC&#34;:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 1214:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 srcrev =3D ud.method.latest_revision(ud, d, =
name)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1215:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1216:=C2=A0=C2=A0=C2=A0 return srcrev</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1217:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1218:def get_checksum_file_list(d):</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/__init__.p=
y&#39;, lineno: 1626, function: latest_revision</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1622:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key =3D self.generate_r=
evision_key(ud, d, name)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1623:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1624:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return revs[key]</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0 =C2=
=A01625:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 1626:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 revs[key] =3D rev =
=3D self._latest_revision(ud, d, name)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1627:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return rev</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1628:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1629:=C2=A0=C2=A0=C2=A0 def sortable_revision(self, ud, d, name):</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 1630:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 latest_rev =3D self._bu=
ild_revision(ud, d, name)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">File: &#39;/home/sbaby=
/workspace/09252023/ecp-wap-appserver/poky/bitbake/lib/bb/fetch2/git.py&#39=
;, lineno: 739, function: _latest_revision</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0 =C2=A0=C2=
=A00735:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#34;&#34;&#34;</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0736:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compute the HEAD revisi=
on for the url</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0737:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#34;&#34;&#34;</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0738:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not d.getVar(&#34;__=
BBSEENSRCREV&#34;):</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">*** 0739:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise bb.fetch2.Fetc=
hError(&#34;Recipe uses a floating tag/branch &#39;%s&#39; for repo &#39;%s=
&#39; without a fixed SRCREV yet doesn&#39;t call bb.fetch2.get_srcrev() (u=
se SRCPV in PV for OE).&#34; % (ud.unresolvedrev[name], ud.host+ud.path))</=
p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0740:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0741:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Ensure we mark as not=
 cached</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0742:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fetch2.get_autorev(d=
)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0=C2=A0=C2=A0=C2=
=A0 0743:</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Exception: bb.fetch2.F=
etchError: Fetcher failure: Recipe uses a floating tag/branch &#39;5.15/lin=
ux&#39; for repo &#39;github.com/intel/linux-intel-lts.git&#39; without a f=
ixed SRCREV yet doesn&#39;t call bb.fetch2.get_srcrev() (use SRCPV in PV fo=
r OE).</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">ERROR: Parsing halted =
due to errors, see error messages above</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Summary: There was 1 W=
ARNING message.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Summary: There were 2 =
ERROR messages, returning a non-zero exit code.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">ERROR: Failed to start=
 bitbake environment<br/><br/><br/>Regards<br/>Simon<span style=3D"font-siz=
e: 7.5pt; font-family: &#39;Arial&#39;,sans-serif; color: #666666;"></span>=
</p>

--dRWdF3o9OctQyB5juujd--

