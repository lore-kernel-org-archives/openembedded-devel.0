Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 667187723D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 15:43:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p63so5364002wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 07:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Lb/NNwmbeEyNBMwQp2+Dl0tdtsjME5U7MqIH5wn+hic=;
	b=Bf0reFvHtmjP6wbqw7oId274xBZyUK+uDKCVptyeXtbWlClfbW5SR/LmnCPIWdc+zo
	hlap5yqKI5CqLHG/2g0kfSAgy8UfNuECUqA9QmK1geFdvaZV7Gb5BYQxwgAspOQ5aRzD
	mWEn0yy0zQ8wezE/ayq5CTtfGaL2I+ENfoJ24SNuOoz0o+I7sR0tthp1pyvJxlhBQL7L
	5RHI8NS5fS2gjGIIR4mbLlPXjII/6s4VTMlGeKkfvXzkoS3XuVlLEZB6RP+hDYgisNL6
	hLh6ly2/FhwULfqq3b9k4igp193lT3qR0uXwLZ6ybsMDUKZCoBlOS0kW7wCi/kWde/JB
	VFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lb/NNwmbeEyNBMwQp2+Dl0tdtsjME5U7MqIH5wn+hic=;
	b=C4u77UXhRhlSIpMrqCHoAOTXd/B3iHRfNa0BVVNuLE4HtE5mG2qcfqQidF65+FY/N7
	u+Ddsu/XNNZjs/tIcxthjM51Xx9wGhMLbLL5IBu27nUrn+k1xHJm90IdcDU2SpSZk2CA
	kULN+IsyGoZMifAHQeehvlpX19EuuZcxMn0KkJ2SMU1usoK8hPGBIt/waBSpwy+7oG5r
	sGptyN5/S49c7DqXPj8b1j0+X/A5imH9AvH0JZFvv6/61a6wpLCRisZ+Zakis+9F8oai
	kNJztWXatziGZmCqaVuGaXRH3+oTdDbayQpJmuB6ftlSnvHfsqU0o4QzW7SE5/la3BNG
	B6FQ==
X-Gm-Message-State: AG10YORwqT6wbfxKHq6W2urFqh2WLJnGxlaBCATPHJ6imzdmov+C9yH6JqW5LljFFvsINw==
X-Received: by 10.194.156.199 with SMTP id wg7mr21562408wjb.114.1454254992408; 
	Sun, 31 Jan 2016 07:43:12 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id 75sm7244588wmo.22.2016.01.31.07.43.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 07:43:11 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2016 16:42:47 +0100
Message-Id: <1454254968-8596-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] mongodb patch
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
X-List-Received-Date: Sun, 31 Jan 2016 15:43:14 -0000

A v2 Patch that adds libpcap dependency. Otherwise if libpcap is available,
scons would detect that and build mongosniff that links against libpcap. So if
we don't depend on libpcap but it is there, we get a QA warning. If we depend
on it, scons will always build mongosniff and always link against it.

Sven Ebenfeld (1):
  mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist

 ...Make-it-possible-to-disable-the-use-of-v8.patch |  50 --------
 ...to-use-build-settings-from-environment-va.patch |  67 +++++++++++
 ...02-Fix-linking-when-scripting-is-disabled.patch |  25 ----
 ...d-mongo-binary-when-scripting-is-disabled.patch |  64 -----------
 ...ce-os.uname-with-os.getenv-OE_TARGET_ARCH.patch |  50 --------
 ...ports-atomic-ops-for-armv5-and-up-but-onl.patch | 127 ---------------------
 meta-oe/recipes-support/mongodb/mongodb_git.bb     |  66 ++++++-----
 7 files changed, 105 insertions(+), 344 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
 delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
 delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
 delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch
 delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch

-- 
1.9.1


