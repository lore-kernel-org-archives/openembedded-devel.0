Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14A9C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:05:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.8907.1678889108527287704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=KiQDrhD3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889106; i=@fujitsu.com;
	bh=/yL71xFBNAoVHTJnY45RSi8t4+eHx5nWnu9KGBGutls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=KiQDrhD3aAjHD4Ustqs70x9h7JmIwGdDxpkelHIQ73AQWO4JJgGfMYV2WTjtKcoDT
	 lDJKlcAuiQUGh2rGXj+9ExUGLFwXVeWqoFP0qQzpFVuQkQSuVJRtRggp4Ej0nntSAg
	 GKkoKgOICv19nfaxK6a/bmIBvcVN+7itiWT01UEi/098aEg+FgLHlBqAOI7rC+GGHx
	 H3gpUSczCXqvi3XbwmEDSMMjGt7ETjYLkc8GB6cLT8GACEFiXsV9AYaOGFUGZiDi2+
	 jl4olUdLOugxBrrs7citGDMrEqlpIpU1XOCv3dALOPve+ejsA30vrEcqIuylaFOtOi
	 PicseOv1LAq3w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsViZ8ORpDvpgmC
  Kwf01ohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bvizdYCppVKmZ23WdtYFwi28XIxSEk8JBR
  Yvr1k4wQzhUmib4rZ9khnD2MEp/vrmftYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAS+L1vkcsIDaLgKrExVezwWp4BZwkbp2dxAhiSwgoSEx5+B4szingLPH5bS9QnANomZ
  PEx43WEOWCEidnPmGBGK8p0br9NzuELS/RvBVipISAosTsy80sEHaFROP0Q0wQtprE1XObmCc
  wCs1CMmoWklGzkIxawMi8itG8OLWoLLVI19BML6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQ
  L7G8WC+1uFivuDI3OSdFLy+1ZBMjMNxTitPMdzAe6/urd4hRkoNJSZT3zxqBFCG+pPyUyozE4
  oz4otKc1OJDjDIcHEoSvP/OCKYICRalpqdWpGXmAGMPJi3BwaMkwpt6HijNW1yQmFucmQ6ROs
  Woy7H46pW9zEIsefl5qVLivH9BigRAijJK8+BGwNLAJUZZKWFeRgYGBiGegtSi3MwSVPlXjOI
  cjErCvMtALuHJzCuB2/QK6AgmoCN45wmAHFGSiJCSamCqD4k+0LGmivNM780a3dbXr7hm5DVu
  muoam7dkmg3ri7gPG39Iqm+LeLSXwblxHcvpEL2IFWyOF44s/f7hsTD7NK0JnLbdNjW3ZvBO/
  xNs83Gy4f33e2p7Fhx42fPlW5uDTtIU66Oz78c9tf3/m2vSqWt5JXZ3NtgWXy7Kejg56oCEfd
  DnPdZrzolohgtVh7gJz/pvZvxdRuJDSOlCn7MZux8wL1qz0aLbkGFvuRbvx0cG27euTWSO8jE
  +aBjx4dbHRbKPsuWXX3mTEm5VEddz9I3JEv/J12ap2Ja1F+St+sW37UbQpAn6PBcvG94y2TQl
  paehJNv3l6Tp9xjPb+E/jn88EWu+lL30xt/jWlsZlFiKMxINtZiLihMB5o8jTn4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1678889105!66855!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7460 invoked from network); 15 Mar 2023 14:05:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:05:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AC66F1B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:05 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9EB281AD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:05:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bandit: upgrade 1.7.4 -> 1.7.5
Date: Wed, 15 Mar 2023 22:04:40 +0800
Message-ID: <1678889082-20604-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
References: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101540

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Add an example screen shot of Bandit to README #847
    Bad link to screen shot #848
    Use a constant for weak hashes #850
    Group location line with code output #822
    Fix line range using Python 3.8 end_lineno #821
    Add classifier to indicate Py3 only #853
    Removal of blacklist call B309 httpsconnection #858
    Remove blacklist call check for os.tempnam #859
    Indiciate hash type in message #860
    Add the httpx module check for verify #861
    Add doc for hashlib plugin #862
    Make use of rich for progress bar #863
    Replace toml with tomli #829
    Fix up B109 and B111 removed plugins docs #864
    add check for "requests" calls without timeout #743
    Fix for build breaks in format job #869
    Add license and contributing links to docs #867
    Remove redundant word Bandit in titles of sections #873
    Add request for feedback via =F0=9F=91=8D #871
    Add a Discord link to the docs #870
    Adding logging.config.listen() plugin with examples #874
    Removal of ghugo #881
    Remove redundant pip line #884
    Corrected documentation on configuration #868
    Start testing against Python 3.11 #887
    Add myself to sponsor list #885
    Add Discord link to README #875
    Update action versions in Actions workflows (#890) #893
    Add dependency review action #891
    Fix an unclosed tag in HTML formatter #896
    'Test plugin listing' in docs incorrectly pointing B612 to plugin ref of B102 #897
    Make small fixes in docs #899
    Specify semver range for Python 3.11 #901
    Add another bad example of yaml load #905
    Add releases link in "Version control integration" #909
    Update version of dependency-review-action #911
    Avoid redundant message if debug on #913
    Remove invalid checking on hashlib #914
    Add some missing curve types #920
    add jsonpickle deserialization blacklist #707
    Fix reading the number argument from config file #923
    Add end_col_offset if available #851
    Enhancement Proposal: Plugin "assert_used" config-skip snippet #695
    Blacklist pandas read_pickle and add functional test for it #710
    Docs for request without timeout has dead link #925
    Add case for global exec #570
    Fix a false positive condition yaml_load #927
    Fix issue #453 jinja2 template select_autoescape when using jinja2.select_autoescape #454
    Adding tarfile.extractall() plugin with examples #549
    Check for deprecated TLS 1.1 #928
    weak_cryptographic_key assumes positional arg #930
    Fix filename of B202 in docs #932
    Remove python 2 reference in docs #933
    Pass correct number of arguments to match the %s placeholders. #934
    Fixup some invalid pickle testing #924
    Fix json and yaml formatters to respect num lines #929
    Fix AttributeError on detect of tuple assign condition #931
    [docs] Mention exclude_dirs option available in TOML and YAML #876
    Typo fix #945
    remove py2 exec example in docs #947
    Add official Python 3.11 support #964
    DOC: Add explanation on how to use pre-commit with config file #968
    Fix breaking build due to new tox #983
    Correct build status badge in README #980
    Improve detecting SQL injections in f-strings #917
    Improve handling nosec for multi-line strings #915
    Check for github action updates monthly #989
    Added a bit more project_urls #985

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.7.4.bb =3D> python3-bandit_1.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.4.bb =3D> python3-bandit_1.7.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
index cfdbde968..5e2a7e8bc 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Security oriented static analyser for python code."
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] =3D "2d63a8c573417bae338962d4b9b06fbc6080f74ecd955a092849e1e65c717bd2"
+SRC_URI[sha256sum] =3D "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
 
 DEPENDS =3D "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


