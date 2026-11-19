Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7684.1795060353939193962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 19:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VOYRqfrT;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1601867c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 19:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060353; x=1795665153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qu7DPKbfJC3u1xK/T8HF5OPDlXgyIAQt+RI1CNmeOJA=;
        b=VOYRqfrTZVmTWsjgPWOHknWaMNDhMu4L2kYJIyl3cKYmM9/MFPftItJg+QkzgbPj9/
         ZFgtBfRD4aFtF/11O2Q+0cAdkNctqNkbuvpxBjKVRz1GASDGgc4VsKegJ0VpsWyilM1V
         ECKA2tlXrj4AQN/9SIXoxF289yQ67QYdj1TLbKDaZtpqEHgnWJhZhticonEv8+yPlgDf
         zAhjIJjgOluO0mYTjNSWci3XdmJm5ux6VS1NgJ5aB/mhrqcVs+vIVAX+b8+WQGrM9hCZ
         Mv5XtRYecn4+0qLxkoS9vsJ4wsIzujXhrMsCsOm1lwrItwnxkY+MeFVbkOkCqkG3b6fN
         DfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060353; x=1795665153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qu7DPKbfJC3u1xK/T8HF5OPDlXgyIAQt+RI1CNmeOJA=;
        b=TkdSJWCAsAB0co/l/mnyEfcl9+j4Y/xWgYYR0JqgYQoi1o2sNX5xYRkgKwvjwoTNyd
         DACZaAxBrwWBfgxRkOVY4jvHGCGpEPLzwsIquYqCUtwoU42Oahm3LmTrSrHYtZ6mUWRa
         DX7E35eMYkYUYqGzLmMVilGSZUsd5XApqAgZBVQLLyu35SibUld3JZKTvM0otPzbTOUQ
         LhUY/W/xeTudYa0sXAbQ9xf/i70NJZ6DPdw3vRdYUAN4X/a1/gNxkec3uqMJsAO2BFYc
         /i7Q3Zvk0tWhb6T5Gz6NlsP2OSo9Vyn1f33NPGQC37ObjrMmp+ytxFkvoFYaOLL6ywxq
         bZbQ==
X-Gm-Message-State: APuU4Z+xVHUyOI3U4rkl5b8tC1fo+2DjbcnRri//kwHDyfv4lLk1ar8i
	ZTRw5ANQGcHlvAzFUVJ6C2kYFZPjOSzChx/z8C/Uziat1cqqBzGmrpEnNqBXxHDu
X-Gm-Gg: AYBFou1YuoKmGuzP4062IKq0MYbJlbD1QwkUn0GMuD4t6FKloH1jBF4bc80THay8o6H
	/kOqjgdoB1/Itc+xoe/228X1ooqmT+SmCQyIW0rAMsUSrX7yy12ZsQjYGdCkO0ebLZtO/GqGgnc
	8jwWBQUaSO/F37DwEp+eCFx1KF7FA51ouqEe3v41ETXKENi1upvBkmXgNWw6tIcKCIP1tnfKHGw
	wfh5CALcIGReJAHJPmiN0w5nY58IkVY/l5Pi9SskeA7b4WJPE/tjEApFsqHyJ2RWVhuouuLzUZY
	8aSujinmT1+5ceQig8Z8d3czsOR8WCRhAEaeEvhMaCQVz/k77BbEuLLy1viZqwgoMOJIHTOa3su
	iL7jGeXlv3/jxind2XsFobjUmSghb/9DaHC6BnMicl1kY9xA6K39MzVbUHvTwwXBt7T0NAdYji8
	jo8xl57jAZWCt7D3gDkP1LALSKl12TldP7lApYsDabZ7g71dQEQNd5oGtnKPgAx/o2YQFzowFZQ
	fib4bFODPbCj9RbF/Jjh5hgI9x0Ars6hImJWx3pABYstcJYlTQk2dGdiejxgu49ehrQAnQNJxYi
	BXVDiISE+NiVRGf3yAOcl0bjSr9dgTN2YdXt+qdMvaqwNZbS5Y+Fov4V5+8qNf0WxuexjPJfknM
	+DAlV9X3ur49fOpB3lBdKdwlKBCJTeVze2zDkhJwhUnfYDGux5RUxidpfEnVzt1HqgOYLTv9eHJ
	Ss+OQ8ByKiQnGM7nqbLgXJ3iyMo6sHP+9RIOM0MU3yQ9K1cYa1KpBTrR6aR/J/oMyHPpxjN9IFW
	+HpdVAp1wwPlnWCngRqHrcj6fWxqRmzZ1rhSx/9ZMRKkgwkZX1PyO3xi/RuK92jFuYBWebiL/ft
	oPZpO6tNOBw2eR+6yWKoFNsYEfk=
X-Received: by 2002:a05:7023:a8c:b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1b543cb495dmr4440351c88.15.1795060353065;
        Wed, 18 Nov 2026 19:52:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15342139c88.13.2026.11.18.19.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:52:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/4] libcdio-paranoia: Enable linker version script explicitly
Date: Wed, 18 Nov 2026 19:52:26 -0800
Message-ID: <20261119035228.1759400-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
References: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132667
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults to
--no-undefined-version and rejects it, so with ld-is-lld configure
decides version scripts are unsupported and the library is built without
any symbol versions, silently changing its ABI. Consumers linked earlier
against the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

Every supported linker handles version scripts, so enable them
explicitly instead of relying on the broken probe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb
index b880f3f090..3fbd40e7e2 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb
@@ -15,6 +15,8 @@ UPSTREAM_CHECK_REGEX = "release-(?P<pver>\d+(\.\d+)+\+\d+(\.\d+)+)"

 inherit autotools pkgconfig github-releases

+EXTRA_OECONF += "--enable-ld-version-script"
+
 PACKAGES += "${PN}-utils"

 FILES:${PN} = "${libdir}/${BPN}${SOLIB}"
