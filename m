Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6800EC433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:01:03 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.29782.1652086862827726779
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=tumWpTOA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086861; i=@fujitsu.com;
	bh=lA60BpYTxNZgXpCWvkal7gDmCcaL2fUDkXYOhmDN6lY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=tumWpTOAFmrf7sFBnu7J9G6cXvGwaVKHlzYjTVg17dGvJRMOymsXs8raGAq6YMAQq
	 L1pq/qkJKMrMa0ui3VDX+FiDoRY9gvT8mFhDqypDlpoVhK2oc7ml+32RnnRNqFO+Qk
	 XlvLMrG7RA8zMwUon1PYHrQOiGT0j6YS2X1g6+uyYGTKm4cUn25HFBDgpA6BIji0zU
	 SY9H+CFtyAVU8hWpuSGFZrfeLkHwIzE49zYf70hNEhRrpt5KoTUnJEuGgUWZWEau7c
	 z7TDPQNQxf8NsGUQAMw1U/B8Q1Rouzu97GKOrt49qYz+HznoUoy8sfYq8a+QT3kcIQ
	 K9eEwtYC//9ug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRWlGSWpSXmKPExsViZ8MRoutzoyL
  J4GqHscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF47huWghXcFbOeX2RvYFzO1cXIxSEkMItJ
  4sW7SYwQzn5GiYd3L7N2MXJysAnoS2xc94kJxBYBspfO3sMMYgsLeEn8ufyBBcRmEVCReH70N
  1icV8BdonNBH1ivhICCxJSH76HighInZz4Bq2cW0JRo3f6bHcKWl2jeOhuohgOoXlFi9nR5iN
  YKideHLzFPYOSdhaR7FpLuWUi6FzAyr2K0TSrKTM8oyU3MzNE1NDDQNTQ01TWz1DU30Uus0k3
  USy3VTU7NKylKBMrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmBKsavXDsYjfT/1DjFKcjApifKu
  v1qRJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9yNITrAoNT21Ii0zBxgNMGkJDh4lEd4ukDRvc
  UFibnFmOkTqFKOilDhv4nWghABIIqM0D64NFoGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKg
  nzhoNM4cnMK4Gb/gpoMRPQ4o8BpSCLSxIRUlINTOFzCwuy1EwfLLV/5BVd/H3fxPVsjjH7pq5
  IfJ5zWb7Na1aVdkCmx/Gf5w23LJ6k9d5ulrheyGSNKGZTjq4HPl7CvTMsdIU792W8e28WpWe3
  54frh0nZJTENXNaW6myTrhzc2KJ/LafxwQNtT4/LRe69J15ef1u/7UTT4664K85P38UHv1jU7
  Jbh+dywXfnXj+zFyzcWO5R+uKyorn3NufLi8wLVn88DtmxzEelS+PBF4UmXxcItErIXd2etWr
  9reRfDboaQvsVPkhZPzxLZ653PayUavTcnyP69zzsX9rUx1l37mj5fmfUorouZhXO7x66l74t
  L9rWsjrCdlT5hWcPPbd5XaldHHo6+rx4nqMRSnJFoqMVcVJwIABmvL2E7AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-545.messagelabs.com!1652086860!463752!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29314 invoked from network); 9 May 2022 09:01:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:01:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 24990vCF018304
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 10:01:00 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:00:56 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] gnome-text-editor: upgrade 42.0 -> 42.1
Date: Mon, 9 May 2022 17:00:44 +0800
Message-ID: <1652086844-2662-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:01:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97015

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =E2=80=A2 Improved preference dialog styling for libadwaita
 =E2=80=A2 Build system fixes
 =E2=80=A2 Fix icons for zoom controls
 =E2=80=A2 Fix titles in save-changes dialog
 =E2=80=A2 Translation updates

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{gnome-text-editor_42.0.bb =3D> gnome-text-editor_42.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.0.bb =3D> gnome-text-editor_42.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
index 01504b1cb..7efc6867d 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
 
-SRC_URI[archive.sha256sum] =3D "0e32140ee1c13428563bcd5f784e61ee22ffd1ad27d8c02283b4358a81dfab50"
+SRC_URI[archive.sha256sum] =3D "a3c8508033bfb63a8b48a062ac1e67b2c333ba0153879b38c661968a103ad15c"
 
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
-- 
2.25.1


