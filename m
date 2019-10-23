Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 467F67F89D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:14:02 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 21so1972105pfj.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=msuyBThiLUVogPlfIca8UOJWcxVOVm8lWpLV5fBVeE4=;
	b=oFjYZ2Dq/+nK0OAUEjXQVsXE7M5FkMzhZPgDlXZLaTa23s9v6RNhWyvHl08UiZtFbG
	TH40Hpof0mEuE9zvX8YzrNF4E6XJei8pMfnWXw6uOHeOjouWF1xOF0c7FoFTOk9MNt3b
	u9NWQHbAjYjignypusgFuIDh2wfqfNBGPeWvOIquUWMCbgoR8y/Wusj3h0ZaJ4pzk88o
	7LHw8xWKATi/0ixUys+uewoLaR9O+2hYTi3EmhfVNmvXKSSYmN8mKrmYG4zdmHFBCHXM
	mgB5I2cJ2bzLprjBvBwy+v63ChF0WMtwtAQLMjozatqn2+IaaVxyCXEGdLi8ZJxcUqN/
	ZtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=msuyBThiLUVogPlfIca8UOJWcxVOVm8lWpLV5fBVeE4=;
	b=JgcqGGBKXGyJjSlZauCVYFUfL0Xod9FhyR7s6SmCk0zG9lNyriELf7/mO2IkiY0Ujh
	WVpTaOU07bPhiv9cjGYbZLNqHwpLQ2Zy1HCIRUM7kDOYHqEDLaowgQyypPyFJmL5AxAO
	j7vpWZYZrsQZYfmF18mMK3GFApIRYfzpa/NGcC1FFfQhqTMR6V/A+Sv2WDwGua9Fw27m
	n+uE93tUuBXt8pZQkoi64sgBc+D+qQUBnJjiJE0YfH7877CQXLWjPgou6QEUBZ0wng8P
	Zc79SEG4Cvvl3jmv9BPVtap9Q4PjNUhpsT8UQIMvh9k5z3EzOfvoF1IIX17RPrpYIZGR
	9gjw==
X-Gm-Message-State: APjAAAVimXcymZ3AwSh8dcwEA9adkZHY68N5lidSdZ7CUSCLf+ugzrwl
	Wi7C4RFwBVE6GvpmQHEZcelpD1ke
X-Google-Smtp-Source: APXvYqz+8r4taNKVf3/OJAbqQtemfItSUPqr13zoUBPr2DV8azaVWQTrvuTXTwLPta/CqF0O1c0tOQ==
X-Received: by 2002:a17:90a:3086:: with SMTP id h6mr998214pjb.46.1571847243769;
	Wed, 23 Oct 2019 09:14:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:50 -0700
Message-Id: <f59d83d7c51a1d93dfcade6c863a35c67df106f6.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
Subject: [warrior 05/10] jsoncpp: add native BBCLASSEXTEND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Oct 2019 16:14:03 -0000

From: Pavel Modilaynen <pavelmn@axis.com>

Extend to native builds, this is useful for unit tests.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
index 88e3320..97fc6c7 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
@@ -19,3 +19,5 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


