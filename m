Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F25CAC5B2
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.11775.1758615960186880180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 01:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y8V8clQj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HEkT025799
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 08:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wIKkFOI+TedD2M5jPH/DY3
	1S+4kC56w7JOF4150FN6I=; b=Y8V8clQjBL8Iv+06zIa8Fnw/s3WGH+HeFdRqU5
	HIdxo5G301pdg+WTEGemH7QGM1O7+5kBGlRTJQ1xaap2PGE3jmOVOTjXkJzAf+8A
	Os/eLMQI4UGonagX6l81wQ7fW0GNewT4wDio63EGQwK74t+7hpxEeijecDUELdwU
	dlgxDdI5E8+2JeflVoDClakEWcd05+C4VnIr8XIHo2JuBygrXdszmclluej36H1/
	8z7WBBuOkq/v3HBlrcMH7KbHSiRjxOMmZkK1xy4Q98/YTuO8YKUoUrCk1W1cSsjo
	CkW1r1XMiCjn2f32o9jKKeXyFTiFb/mmQ7/zItPAYF/7zG2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7ftj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 08:25:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-726a649957dso102269286d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 01:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615958; x=1759220758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIKkFOI+TedD2M5jPH/DY31S+4kC56w7JOF4150FN6I=;
        b=CMkp0Qed33pbbGEJpHkxRQgVlFWscz1TbMfobrLMzBDZIbcMgNypcqk8DvAeL3WeLD
         /3ArNun+cM2u98ZU1lKsGLrVljvk2Jj8joSFO+KgXtYgazK2LfcitTGgFvrc0VInaP0y
         iB2F/ImtWPIn0RQGQmX8SUMbusR31kUjNSw+roq6sYr+OHvk4ocrAMkPfGoxOrd+RbgO
         /wmvQuzh5W970z1XSAZ5XQISZs3gZwg0LcnNSsFTAxfP1oJZMYEbZWCANsALBe60TLX7
         1G+tLu5rxP/Kjwi1y2soUg7SJ7NcoZia37GGpZ72QKhiCGOSwvp/1/9SVGu7B4CLEVTS
         KLJg==
X-Gm-Message-State: AOJu0YwjntmYobHwoWA7ZYjxwQH20ckE8Oeqom+d+xwuGgMU7SVTKm8d
	QO6l0Aivw7Yz58IG/wKX9SYyCsvox44xF/elB+rcwGzLMzdUZF306ktXJnm4q/qcT6itDjW8fE5
	LHlpF7qIsAtc3SCOh5zSPHnuSzOdV1wUpAkH04ypc9SJR5BXiTHYhpzi0IQyAxWTWsTztcy39RE
	TiwjiHblyQLH0iJ+85
X-Gm-Gg: ASbGnctUoN7twPr0c+exXjAtPYBpF2Q8JYF+BVzbGRJ13oJqwbAsxmYmFbw5SibpL3T
	d1oRhvIvb3BBGxCmeOaamnamP7EpbgqzMmc/bbKo8zsyrY6Z2bebt6n2I5/x64n/Ipnuh0BQ9dr
	SIkW/o0llX4UR2Y+J1VJIgOlkjnTFUsv2BtTIXY7bvmDfUqyTqMGrYI0CokzFjovgi1CyQBLTj6
	PSF54pE62I9w4LSYJnWUJfSMbVX7j4wX5j4T287akiyrzmMmNHdPgjBFreLMHf40K0/OfLdjSfr
	tNcLB5Aahm2y+RXYJi0bUh6B4NHRGY2Hhxl6PXi9NbYNzFhf8kcImfDFcWnyC78=
X-Received: by 2002:a05:6214:1316:b0:7a9:32e8:56f4 with SMTP id 6a1803df08f44-7e715456e77mr20961886d6.44.1758615957320;
        Tue, 23 Sep 2025 01:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiCyp8tZpvS294VFgUbWI7tmWGYGoTGvfLChHJAn77Dp7cxr17qk/G6z8SiFJOfUIreGU+WA==
X-Received: by 2002:a05:6214:1316:b0:7a9:32e8:56f4 with SMTP id 6a1803df08f44-7e715456e77mr20961556d6.44.1758615956417;
        Tue, 23 Sep 2025 01:25:56 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63465bebe76sm1032100a12.15.2025.09.23.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:25:55 -0700 (PDT)
From: "Koen Kooi" <koen.kooi@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH] dracut: update to 108
Date: Tue, 23 Sep 2025 10:25:47 +0200
Message-Id: <20250923082547.893704-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfXysYBQkfmXlOa
 J2MTir/7Aaduy9ctivKRw+fjgMVM3xqT4q92Q95quMxElBpsmvCD11G6WmvlAe2KY2KQ7jgUUNP
 k/C6coux5cv6U4qhF4GZc5oIntUQCmYuxBl9fKrdNfC97Oqyd8ifIMLSzm8LYC145ZktBY3566+
 63WU9Jr1prOsNPB/P+Co5OgqWWaAG5TeMx4OwQDGuS56Qq+ivdDDs8l0SgNhLJTcAFH50fzfcm+
 Xajq3UuS3HzHXlV1aD2KqlK+MWlkgOLE+wAbHY4idi/ktdFjAgj5teqfhI8XLZ3yrw0vdJIdcOF
 SeCExPAqeUu4XLnJ7iX+SoW6X9kPoKcQl+U7Io1/Um/D5JpOlvMWSDt0AM2HDe8hyYpp3l+IBil
 le7bTpsT
X-Proofpoint-GUID: 6TuDbZhMkgOsXZvFuQ2QAdBvPFsJWl6b
X-Proofpoint-ORIG-GUID: 6TuDbZhMkgOsXZvFuQ2QAdBvPFsJWl6b
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d25997 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=jS68BSPeBm6i-HDwY-YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 58N8HEkT025799
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119661

Drop stale patches, add a patch that enables stripping in an OE enviromen=
t.

Upstream changelog:

* systemd-udevd:  99-systemd.rules added in two places ([a8c0a15c](https:=
//github.com/dracut-ng/dracut-ng/commit/a8c0a15cf9b61b7f606e4162164b526eb=
58f620b))
* watchdog:  only install wdctl for the non-systemd case ([ad0fd3a8](http=
s://github.com/dracut-ng/dracut-ng/commit/ad0fd3a8dfcb155290bc8b7ec9f8314=
4daa3d9df))

*   add Debian/Ubuntu specific Dracut configuration ([cba1a2c2](https://g=
ithub.com/dracut-ng/dracut-ng/commit/cba1a2c2cda9d2fb26fb694f59dac88bf1b0=
b725))
*   allow the use of $kernel in initrdname=3D config ([696397dd](https://=
github.com/dracut-ng/dracut-ng/commit/696397dd8d8b200549fba4b564f97b18641=
43093))
*   add support for removing a space separated list of files ([f8dfe3ee](=
https://github.com/dracut-ng/dracut-ng/commit/f8dfe3ee5b958262c38a821b154=
43893e400dba0))
*   make variable set check work with "set -u" ([ee8f4f9d](https://github=
.com/dracut-ng/dracut-ng/commit/ee8f4f9d3e011c829bda7a8b7ee19aef85dd6ffb)=
)
*   support dracutsysrootdir being unset ([348888b8](https://github.com/d=
racut-ng/dracut-ng/commit/348888b8d9067a9e983650129b7a3ea64fb8430f))
*   tests are not packaged by default to simplify packaging ([e65a87cf](h=
ttps://github.com/dracut-ng/dracut-ng/commit/e65a87cf0a14a5c7157ea4cfe56e=
b8639435eaa4))
*   set hostonly_cmdline config to no by default ([efaee447](https://gith=
ub.com/dracut-ng/dracut-ng/commit/efaee4473680db78f4f3244ba952e783ea3b5aa=
9))
*   set hostonly config by default in configure ([62fdf59c](https://githu=
b.com/dracut-ng/dracut-ng/commit/62fdf59c94ef7ec2261d054384ceddff39c3643b=
))
* Makefile:  explicitly list configs to install ([f7416501](https://githu=
b.com/dracut-ng/dracut-ng/commit/f7416501a7465318682bf7c619c1f52bdb6b1b02=
))
* base:  add support for rd.driver.pre ([5ca76df3](https://github.com/dra=
cut-ng/dracut-ng/commit/5ca76df3a29467404611443d75539a02824a0dfa))
* crypt-gpg:  handle multiple gpg pubkeys ([28ad7910](https://github.com/=
dracut-ng/dracut-ng/commit/28ad79106c7fc87ba7f5f6f0c86faeb4191c567e))
* dracut:
  *  drop DRACUT_PATH and rely on PATH ([2606f985](https://github.com/dra=
cut-ng/dracut-ng/commit/2606f985d6f38c464a8485421683571e2df266dd))
  *  support SOURCE_DATE_EPOCH ([dfcfa6fb](https://github.com/dracut-ng/d=
racut-ng/commit/dfcfa6fbe8007e62f4f7977f69646710f0af6100))
  *  allow users to choose which dlopen dependencies they want ([96a91d04=
](https://github.com/dracut-ng/dracut-ng/commit/96a91d04ddf004071007870dc=
1cabab6b4c94f69))
  *  replace ldd with dracut-install --dry-run or header check ([e8b733f7=
](https://github.com/dracut-ng/dracut-ng/commit/e8b733f7c545b35511711ae65=
14065dce6530724))
  *  set systemdversion global var using pkg-config ([ed80f9f4](https://g=
ithub.com/dracut-ng/dracut-ng/commit/ed80f9f42c2e92c9494ddaad9cfca0312319=
eec2))
* dracut-install:
  *  add --dry-run option to replace external ldd usage ([161153f9](https=
://github.com/dracut-ng/dracut-ng/commit/161153f901877f825f3e038367fee631=
eacac8f2))
  *  extend new ELF parsing code to replace ldd calls ([aac5c914](https:/=
/github.com/dracut-ng/dracut-ng/commit/aac5c914af84e8880fcc154ebb93a05c6b=
6855dc))
  *  parse ELF .note.dlopen entries for extra deps ([19b5faad](https://gi=
thub.com/dracut-ng/dracut-ng/commit/19b5faad97971a6d906740de28cfe366a7fae=
687))
* initqueue:  factor out initqueue into its own module ([3daf6783](https:=
//github.com/dracut-ng/dracut-ng/commit/3daf67830d8db3b12bc45eef9f8f29f60=
6192db9))
* network-manager:  use upstream initrd services if available ([83dffc58]=
(https://github.com/dracut-ng/dracut-ng/commit/83dffc58f606ad7ad47a32716c=
e240831d7f018f))
* resume:  do not depend on initqueue if systemd is used ([34457e07](http=
s://github.com/dracut-ng/dracut-ng/commit/34457e070bc9d5c5bc622363eb7acf4=
767f16e46))
* rootfs-block-fallback:  factor out rootfallback into its own module ([2=
676f1a5](https://github.com/dracut-ng/dracut-ng/commit/2676f1a5fc9a090866=
d0b29bf161850a7e93e87e))
* watchdog:  do not depend on initqueue if systemd is used ([c8dbd9ec](ht=
tps://github.com/dracut-ng/dracut-ng/commit/c8dbd9ecc8ea1983c6e51c1205939=
247a434c661))

*   load essential storage kernel modules in sloppy hostonly mode ([87304=
767](https://github.com/dracut-ng/dracut-ng/commit/87304767b16f45b7eacd1e=
5e622adab029e7902e))
*   increase deteminism by not relying on the default sorting from ls ([c=
9f6b867](https://github.com/dracut-ng/dracut-ng/commit/c9f6b8674e38b19c76=
66e30601bb5ed6a205b661))
*   network-manager dracut module no longer depends on systemd ([8f063e23=
](https://github.com/dracut-ng/dracut-ng/commit/8f063e23370e8953b6189990a=
1179517d2454c69))
*   support DRACUT_SYSTEMD being unset ([79ffbd28](https://github.com/dra=
cut-ng/dracut-ng/commit/79ffbd28294818a36e515a441142125d70e3acbb))
*   support hostonly being unset ([c85c9324](https://github.com/dracut-ng=
/dracut-ng/commit/c85c93245bf48d1a47e12c30cdb4aa49ea2a585e))
*   support DRACUT_RESOLVE_LAZY being unset ([3d383ba4](https://github.co=
m/dracut-ng/dracut-ng/commit/3d383ba4fa98993a423c849054cb1d51eff81b24))
*   loongarch architecture support ([38f44b35](https://github.com/dracut-=
ng/dracut-ng/commit/38f44b35d05587c601caea50d765b89be6f9305d))
*   let check_vol_slaves_all return 1 when checks on all slaves fail ([b1=
17013b](https://github.com/dracut-ng/dracut-ng/commit/b117013b7829883f6b2=
b1d0fe12e8a7772a38029))
*   improve hostonly sloppy mode ([53537ae7](https://github.com/dracut-ng=
/dracut-ng/commit/53537ae77e49ab5ba157fdab544489db10ad8b1b), closes [#132=
1](https://github.com/dracut-ng/dracut-ng/issues/1321))
*   load more kernel modules in sloppy hostonly mode ([de862885](https://=
github.com/dracut-ng/dracut-ng/commit/de862885ec55bb19bfa3e3f1afd27577b7c=
5e309))
* Makefile:  remove test modules after renumbering ([80961ee0](https://gi=
thub.com/dracut-ng/dracut-ng/commit/80961ee0b36ca3ff60cacd68986217506c305=
176))
* base:
  *  base module failure if root password is already set ([e4551d40](http=
s://github.com/dracut-ng/dracut-ng/commit/e4551d403f9fd6e09bde401c16bb097=
4bce3a23a))
  *  dracut-lib.sh soft depends on poweroff/reboot/halt ([237108c3](https=
://github.com/dracut-ng/dracut-ng/commit/237108c332a4a738c29e9b5210cdd00b=
7922c6ce))
  *  support PREFIX being unset ([7bea9dfe](https://github.com/dracut-ng/=
dracut-ng/commit/7bea9dfed63207b1fb7b9fd5b5aab4b038727652))
  *  only create nobody user for nfs dracut module ([8934a8e5](https://gi=
thub.com/dracut-ng/dracut-ng/commit/8934a8e50fc89f7f13539be027149b1246c24=
81d))
* dmsquash-live:  erofs collision with latest util-linux ([950475e8](http=
s://github.com/dracut-ng/dracut-ng/commit/950475e848c9eec03b5283bfd1d8722=
c051edd2d))
* dracut:
  *  only call uname -r if it is safe to do ([3f4497ed](https://github.co=
m/dracut-ng/dracut-ng/commit/3f4497ed842ba8be998893b441cc936e2721cd63))
  *  detect if systemd-detect-virt is available before calling it ([5d329=
8ea](https://github.com/dracut-ng/dracut-ng/commit/5d3298ea9ed8790e57514d=
1d0ea2117fb7af363b))
  *  consolidate reporting running in a container ([000f5dbf](https://git=
hub.com/dracut-ng/dracut-ng/commit/000f5dbfb6539d03fc90165d04de88b49ff6be=
db))
  *  ensure hardlink deduplication is reproducible ([9fdf683f](https://gi=
thub.com/dracut-ng/dracut-ng/commit/9fdf683f6d2f7c6ecbd98884f142de86bbea5=
a56))
  *  respect PKG_CONFIG env var instead of hardcoding pkg-config ([0ee92d=
bb](https://github.com/dracut-ng/dracut-ng/commit/0ee92dbba684e2c39b615a5=
0b03ae5d15e3dc18e))
* dracut-init:  use sysroot when checking udev rule program existence ([c=
1000cda](https://github.com/dracut-ng/dracut-ng/commit/c1000cda35959b6f7d=
fb2e88cc657a846e44d841))
* dracut-init.sh:
  *  support DRACUT_NO_XATTR being unset ([d520252a](https://github.com/d=
racut-ng/dracut-ng/commit/d520252aae1553ecc4d368236287baf3a32040c9))
  *  initialize _files in inst_libdir_file ([2311abeb](https://github.com=
/dracut-ng/dracut-ng/commit/2311abeba53ec353f494240d7da9b24aad9e3d5e))
* dracut-initramfs-restore:  check for Debian initrd.img symlink ([f80128=
e9](https://github.com/dracut-ng/dracut-ng/commit/f80128e91aae68449e1006c=
c7a9d6fcf8eacea32))
* dracut-install:
  *  sort output of --modalias ([41e43068](https://github.com/dracut-ng/d=
racut-ng/commit/41e4306840959b88758aad6a768c613b0864c763))
  *  install all suppliers of a supplier's module ([80574db7](https://git=
hub.com/dracut-ng/dracut-ng/commit/80574db78cf7d0cf007d933cf950ac159f6de3=
b3))
  *  do not limit supplier handling to platform bus ([e35c5173](https://g=
ithub.com/dracut-ng/dracut-ng/commit/e35c517310d7e5edb24c10bf5be7f5975021=
97a2))
  *  add sysfs node parents' modules as dependencies ([3607cd8f](https://=
github.com/dracut-ng/dracut-ng/commit/3607cd8fcbe433802e70d7cc055b18f829c=
b3b3c))
  *  rework broken destination existence logic ([425e263b](https://github=
.com/dracut-ng/dracut-ng/commit/425e263be559c7a005579072f4051c047a1c1511)=
)
  *  plug memory leak on kerneldir ([082b6b0a](https://github.com/dracut-=
ng/dracut-ng/commit/082b6b0a6e544865948f177126aac7d40c69b1ba))
  *  deadcode.DeadStores static analyzer warnings ([28041543](https://git=
hub.com/dracut-ng/dracut-ng/commit/28041543f661a918ce1eb97ce0b69b20cb891c=
9b))
* dracut-lib.sh:  initialize variables in getargs ([ef60bd71](https://git=
hub.com/dracut-ng/dracut-ng/commit/ef60bd7179505b49ef4c9fd077d7647e0161af=
2b))
* dracut-logger.sh:  initialize errmsg in dlog_init ([f35a8c7f](https://g=
ithub.com/dracut-ng/dracut-ng/commit/f35a8c7f04c02cea063a8c0346c9993f120a=
8196))
* dracut.conf.d:  reserve namespace 50 to out-of-tree configurations ([d4=
70b436](https://github.com/dracut-ng/dracut-ng/commit/d470b436aecceacd520=
d1629484e7365c9607183))
* dracut.sh:
  *  do not use uname to detect kernel version in a container ([2b2debd7]=
(https://github.com/dracut-ng/dracut-ng/commit/2b2debd7947b7d5a357c1a8969=
1a75dfd3565747))
  *  initialize variables that get exported ([50426818](https://github.co=
m/dracut-ng/dracut-ng/commit/504268187b863d11a8c39e0a242aa77e688c8b0d))
  *  don't pass empty string as dir ([758f3eaf](https://github.com/dracut=
-ng/dracut-ng/commit/758f3eaf61ac210507715f4b5681e24f6dc4d3b0), closes [#=
1275](https://github.com/dracut-ng/dracut-ng/issues/1275))
* fcoe-uefi:  exit early on empty vlan ([555b6e1d](https://github.com/dra=
cut-ng/dracut-ng/commit/555b6e1d685ce5960109aefe736ed3ebdf50a839))
* fips:  make sha512hmac an optional requirement ([3d319b55](https://gith=
ub.com/dracut-ng/dracut-ng/commit/3d319b55a65d9be2c9a9dade3c23cd0f377416b=
7))
* generic.conf:  increase ordering for generic.conf ([d823fd86](https://g=
ithub.com/dracut-ng/dracut-ng/commit/d823fd86d364dce3b26cd0cc441aa4c86a8d=
b20c))
* i18n:  add $dracutsysrootdir to systemd-vconsole-setup.service path ([9=
0956522](https://github.com/dracut-ng/dracut-ng/commit/90956522ba143125de=
9f060368cef83aa64e1a3e))
* livenet:  drop stray command call ([9135136d](https://github.com/dracut=
-ng/dracut-ng/commit/9135136d7dfca0deb8b0c618c43e3ffcc35b3090), closes [#=
1240](https://github.com/dracut-ng/dracut-ng/issues/1240))
* lsinitrd:  resolve initrd to real path ([22d93bc0](https://github.com/d=
racut-ng/dracut-ng/commit/22d93bc0cd5afd0d9170c6bdc8ba7ceac68b8eb5))
* man:  document what to expect running dracut non-root ([b853eba8](https=
://github.com/dracut-ng/dracut-ng/commit/b853eba87684d608637493f8c8214dda=
4ec96102))
* modules:
  *  free up range 00-09 to out of tree dracut modules ([1edcb076](https:=
//github.com/dracut-ng/dracut-ng/commit/1edcb07619958f05727d3c30b72f7810b=
62c22a1))
  *  document known module dependencies ([2d98ddb5](https://github.com/dr=
acut-ng/dracut-ng/commit/2d98ddb5d273348db32c248561560dc0975a0189))
  *  move more modules with unimportant ordering to 70 ([c439438d](https:=
//github.com/dracut-ng/dracut-ng/commit/c439438d4f87f391db021b6037830a034=
f321dfd))
  *  all modules with 99 ordering should have a unique number ([2199846f]=
(https://github.com/dracut-ng/dracut-ng/commit/2199846ffebca406a957b78150=
9c42a42d101ba7))
* network-manager:  depend on dbus only when using systemd ([58baf861](ht=
tps://github.com/dracut-ng/dracut-ng/commit/58baf861c68b1f233da4c89d1a8a3=
98ac307cb6c))
* simpledrm:  add =3Ddrivers/gpu/drm/panel ([b7a2f8d0](https://github.com=
/dracut-ng/dracut-ng/commit/b7a2f8d0bdcc57ef7ad137fde657c4a359b7a824))
* systemd:
  *  systemd.volatile needs overlayfs kernel module ([e1452003](https://g=
ithub.com/dracut-ng/dracut-ng/commit/e14520035286dbb4ee856cac2e05c1f21c6e=
148d))
  *  make checking for systemd availability consistent ([8e575556](https:=
//github.com/dracut-ng/dracut-ng/commit/8e575556da2bc6d41265fdffd4c4bf7bd=
69ab71e))
* systemd-cryptsetup:  don't pull in fido2/pkcs11/tpm2-tss if omitted ([0=
1b369a5](https://github.com/dracut-ng/dracut-ng/commit/01b369a5866853c8dc=
5c53c7d4d8613e5721be34))
* systemd-repart:
  *  allow partition format ([02201361](https://github.com/dracut-ng/drac=
ut-ng/commit/02201361ac0e646f9367ec7f14b215795e89cf6a))
  *  copy systemd system drop-in configuration ([bb8bf124](https://github=
.com/dracut-ng/dracut-ng/commit/bb8bf124526f25ac698ef05bc95eb2fe625d69c7)=
)
* systemd-sysext:
  *  install the required kernel modules ([7f524d3d](https://github.com/d=
racut-ng/dracut-ng/commit/7f524d3d24528a7261f0cce1e445ef464f5bf126))
  *  make non-hostonly non-host ([e42755c3](https://github.com/dracut-ng/=
dracut-ng/commit/e42755c342bdc15ae77be722f0ec2a8c23390be5))
* systemd-sysusers:
  *  maintain users and groups ([50285645](https://github.com/dracut-ng/d=
racut-ng/commit/50285645e617a537e69d4eb8f22dbe83c9b22665))
  *  remove (g)shadow created by systemd-sysusers ([97b5f91f](https://git=
hub.com/dracut-ng/dracut-ng/commit/97b5f91ff043b13b213438295675ff85e83dc6=
de), closes [#1242](https://github.com/dracut-ng/dracut-ng/issues/1242))
* systemd-udevd:  handle root=3Dgpt-auto for systemd-v258 ([fa17b6fb](htt=
ps://github.com/dracut-ng/dracut-ng/commit/fa17b6fb0e5a226a83588c2d8fdec5=
ff285f5eab))
* test:  renumber test modules to 70 ([99ed458b](https://github.com/dracu=
t-ng/dracut-ng/commit/99ed458b5b1870c57e936a216149c9b7bb5b9f21))

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 ...all-split-ldd-command-arguments-for-.patch | 91 -------------------
 ...cut.sh-try-STRIP-for-strip_cmd-first.patch | 33 +++++++
 ...n-symlink-in-dracut-config-examples.patch} | 14 +--
 .../dracut/{dracut_106.bb =3D> dracut_108.bb}   | 47 ++++++++--
 4 files changed, 79 insertions(+), 106 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-fe=
at-dracut-install-split-ldd-command-arguments-for-.patch
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-fe=
at-dracut.sh-try-STRIP-for-strip_cmd-first.patch
 rename meta-initramfs/recipes-devtools/dracut/dracut/{0001-fix-broken-sy=
mlink-in-dracut-config-examples.patch =3D> 0002-fix-broken-symlink-in-dra=
cut-config-examples.patch} (83%)
 rename meta-initramfs/recipes-devtools/dracut/{dracut_106.bb =3D> dracut=
_108.bb} (59%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-drac=
ut-install-split-ldd-command-arguments-for-.patch b/meta-initramfs/recipe=
s-devtools/dracut/dracut/0001-feat-dracut-install-split-ldd-command-argum=
ents-for-.patch
deleted file mode 100644
index febdbdbddd..0000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut-inst=
all-split-ldd-command-arguments-for-.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 38dea7dd671fd621b563377cfbd95e4783568c6e Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
- <zboszor@gmail.com>
-Date: Fri, 7 Jun 2024 10:32:40 +0200
-Subject: [PATCH] feat(dracut-install): split ldd command arguments for
- execvp()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-This restores a not-so-subtle feature of previously executing ldd
-via popen(), i.e. the ability to use a cross-compiled sysroot.
-
-The ldd command may be passed in via the DRACUT_LDD environment
-variable, and the command may contain command line arguments.
-The number of such arguments are not known in advance.
-
-Split the command into executable and arguments and run it
-via execvp().
-
-Fixes: d010fa0d7f8ef42ad31729d027d2e4be6dd6e588
-Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
-Upstream-Status: Submitted [https://github.com/dracut-ng/dracut-ng/pull/=
339]
----
- src/install/dracut-install.c | 47 +++++++++++++++++++++++++++++++++++-
- 1 file changed, 46 insertions(+), 1 deletion(-)
-
-diff --git a/src/install/dracut-install.c b/src/install/dracut-install.c
-index e9708c45..724b27b5 100644
---- a/src/install/dracut-install.c
-+++ b/src/install/dracut-install.c
-@@ -559,10 +559,55 @@ static int resolve_deps(const char *src)
-         log_debug("%s %s", ldd, fullsrcpath);
-         pid_t ldd_pid;
-         if ((ldd_pid =3D fork()) =3D=3D 0) {
-+                char **cmdline =3D NULL;
-+                int start, pos, idx =3D 0;
-+                /* Account for at least 2 elements plus the terminating=
 NULL in cmdline */
-+                int args =3D 3;
-+
-+                /* Estimate the number of space-separated elements in t=
he "ldd" string */
-+                pos =3D 0;
-+                while (isspace(ldd[pos]))
-+                        pos++;
-+                for (; ldd[pos]; pos++) {
-+                        if (isspace(ldd[pos])) {
-+                                if (pos)
-+                                        args++;
-+                                while (isspace(ldd[pos]))
-+                                        pos++;
-+                        }
-+                }
-+
-+                cmdline =3D malloc(args * sizeof(char *));
-+                memset(cmdline, 0, args * sizeof(char *));
-+
-+                pos =3D 0;
-+                while (isspace(ldd[pos]))
-+                        pos++;
-+                start =3D pos;
-+                for (; ldd[pos]; pos++) {
-+                        while (ldd[pos] && !isspace(ldd[pos]))
-+                                pos++;
-+
-+                        cmdline[idx] =3D malloc(pos - start + 1);
-+                        memcpy(cmdline[idx], ldd + start, pos - start);
-+                        cmdline[idx][pos - start] =3D 0;
-+                        idx++;
-+
-+                        if (!ldd[pos])
-+                                break;
-+
-+                        while (isspace(ldd[pos]))
-+                                pos++;
-+                        start =3D pos;
-+                }
-+
-+                cmdline[idx++] =3D fullsrcpath;
-+                cmdline[idx] =3D NULL;
-+
-                 dup2(fds[1], 1);
-                 dup2(fds[1], 2);
-                 putenv("LC_ALL=3DC");
--                execlp(ldd, ldd, fullsrcpath, (char *)NULL);
-+                execvp(cmdline[0], cmdline);
-                 _exit(errno =3D=3D ENOENT ? 127 : 126);
-         }
-         close(fds[1]);
---=20
-2.45.2
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-drac=
ut.sh-try-STRIP-for-strip_cmd-first.patch b/meta-initramfs/recipes-devtoo=
ls/dracut/dracut/0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patch
new file mode 100644
index 0000000000..00d75ccff6
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut.sh-t=
ry-STRIP-for-strip_cmd-first.patch
@@ -0,0 +1,33 @@
+From b8504fdbc6ac7b49aa0a9671267be8ac7affb2ee Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@oss.qualcomm.com>
+Date: Thu, 19 Jun 2025 16:06:14 +0200
+Subject: [PATCH 1/2] feat: dracut.sh: try $STRIP for $strip_cmd first
+
+When using dracut in a cross enviroment, like OpenEmbedded, the host
+provided strip (or eu-strip) won't work, so try using the $STRIP
+variable from the shell environment first before falling back to path
+based lookups.
+
+Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
+Upstream-Status: Submitted [https://github.com/dracut-ng/dracut-ng/pull/=
1639]
+---
+ dracut.sh | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dracut.sh b/dracut.sh
+index 45373efb..dbc5cd72 100755
+--- a/dracut.sh
++++ b/dracut.sh
+@@ -2262,7 +2262,8 @@ done
+ if [[ $do_strip =3D=3D yes ]]; then
+     # Prefer strip from elfutils for package size
+     declare strip_cmd
+-    strip_cmd=3D$(command -v eu-strip)
++    strip_cmd=3D"${STRIP}"
++    [ -z "$strip_cmd" ] && strip_cmd=3D$(command -v eu-strip)
+     [ -z "$strip_cmd" ] && strip_cmd=3D"strip"
+=20
+     for p in "$strip_cmd" xargs find; do
+--=20
+2.47.3
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broke=
n-symlink-in-dracut-config-examples.patch b/meta-initramfs/recipes-devtoo=
ls/dracut/dracut/0002-fix-broken-symlink-in-dracut-config-examples.patch
similarity index 83%
rename from meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broken=
-symlink-in-dracut-config-examples.patch
rename to meta-initramfs/recipes-devtools/dracut/dracut/0002-fix-broken-s=
ymlink-in-dracut-config-examples.patch
index 7d0b65a161..e2c202a079 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broken-symli=
nk-in-dracut-config-examples.patch
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0002-fix-broken-symli=
nk-in-dracut-config-examples.patch
@@ -1,7 +1,7 @@
-From 8871c593973d9abfef45408575e5da887830f42e Mon Sep 17 00:00:00 2001
+From e01991f1d55d4d1327793790bad3724b89952704 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 May 2025 18:07:27 +0800
-Subject: [PATCH] fix broken symlink in dracut config examples
+Subject: [PATCH 2/2] fix broken symlink in dracut config examples
=20
 Due to commit [1], it installs dracut config examples under /usr.
 But while enable_test=3Dno, the symlink of test in dracut config is brok=
en
@@ -28,17 +28,17 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/Makefile b/Makefile
-index d33aebbc..151d9f79 100644
+index 3a40594b..df7956ab 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -180,6 +180,7 @@ ifneq ($(enable_test),no)
- 	cp -arx test $(DESTDIR)$(pkglibdir)
+@@ -218,6 +218,7 @@ ifeq ($(enable_test),yes)
+ 	done
  else
- 	rm -rf $(DESTDIR)$(pkglibdir)/modules.d/80test*
+ 	rm -rf $(DESTDIR)$(pkglibdir)/modules.d/70test*
 +	rm -rf $(DESTDIR)$(pkglibdir)/dracut.conf.d/test*
  endif
  ifneq ($(enable_documentation),no)
  	for i in $(man1pages); do install -m 0644 $$i $(DESTDIR)$(mandir)/man1=
/$${i##*/}; done
 --=20
-2.34.1
+2.47.3
=20
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_108.bb
similarity index 59%
rename from meta-initramfs/recipes-devtools/dracut/dracut_106.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_108.bb
index d59b357dc1..5c95abbf29 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_108.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
=20
 PE =3D "1"
=20
-SRCREV =3D "956c08774074ddc45b2f975e13d5c13d1fc36eff"
+PV =3D "108"
+SRCREV =3D "97c5568ec42abd5e6035f0cfa9d319ae6ae4e50a"
 SRC_URI =3D "git://github.com/dracut-ng/dracut-ng.git;protocol=3Dhttp;br=
anch=3Dmain \
-           file://0001-feat-dracut-install-split-ldd-command-arguments-f=
or-.patch \
-           file://0001-fix-broken-symlink-in-dracut-config-examples.patc=
h \
+           file://0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patc=
h \
+           file://0002-fix-broken-symlink-in-dracut-config-examples.patc=
h \
            "
=20
 DEPENDS +=3D "kmod"
@@ -18,7 +19,6 @@ DEPENDS:append:libc-musl =3D " fts"
=20
 inherit bash-completion pkgconfig
=20
-
 EXTRA_OECONF =3D "--prefix=3D${prefix} \
                 --libdir=3D${nonarch_libdir} \
                 --datadir=3D${datadir} \
@@ -55,6 +55,32 @@ do_install() {
     fi
 }
=20
+do_install:append:class-target () {
+    # Generate and install a config file listing where the DISTRO puts t=
hings, dracut
+    # is not always savvy enough to figure it out by itself
+    # Since this primarily fixes systemd issues, only install it when us=
ing systemd.
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
+        cat << EOF > ${B}/${DISTRO}.conf
+stdloglvl=3D3
+sysloglvl=3D5
+sysctlconfdir=3D${sysconfdir}/sysctl.d
+systemdutildir=3D${systemd_unitdir}
+systemdutilconfdir=3D${sysconfdir}/systemd
+systemdcatalog=3D${systemd_unitdir}catalog
+systemdntpunits=3D${systemd_unitdir}ntp-units.d
+systemdntpunitsconfdir=3D${sysconfdir}/systemd/ntp-units.d
+systemdportable=3D${systemd_unitdir}/portable
+systemdportableconfdir=3D${sysconfdir}/systemd/portable
+systemdsystemunitdir=3D${systemd_system_unitdir}
+systemdsystemconfdir=3D${sysconfdir}/systemd/system
+systemduser=3D${systemd_user_unitdir}
+systemduserconfdir=3D${sysconfdir}/systemd/user
+EOF
+        install -m 0644 ${B}/${DISTRO}.conf ${D}${libdir}/dracut/dracut.=
conf.d/
+    fi
+}
+
+
 FILES:${PN} +=3D "${nonarch_libdir}/kernel \
                 ${nonarch_libdir}/dracut \
                 ${systemd_unitdir} \
@@ -63,11 +89,16 @@ FILES:${PN}-dbg +=3D "${nonarch_libdir}/dracut/.debug=
"
=20
 CONFFILES:${PN} +=3D "${sysconfdir}/dracut.conf"
=20
-RDEPENDS:${PN} =3D "findutils cpio util-linux-blkid util-linux-getopt ut=
il-linux bash ldd"
+# The native variant uses a non-ldd based method of getting library
+# dependencies, so ldd is only needed on the target
+RDEPENDS:${PN} =3D "findutils cpio util-linux-blkid util-linux-getopt ut=
il-linux bash"
+RDEPENDS:${PN}:append:class-target =3D " ldd"
=20
 # This could be optimized a bit, but let's avoid non-booting systems :)
-RRECOMMENDS:${PN} =3D "kernel-modules \
-                     coreutils \
-                    "
+RRECOMMENDS:${PN}:class-target =3D "kernel-modules \
+                                  coreutils \
+                                 "
+
+BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_STATUS[CVE-2010-4176] =3D "not-applicable-platform: Applies only to =
Fedora"
--=20
2.34.1


