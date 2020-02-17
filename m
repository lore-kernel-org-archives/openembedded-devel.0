Return-Path: <viktor.rosendahl@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 734566150C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 16:39:39 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b17so19177226wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O7EE7F7IdeflaTPsiQTspkafhlHyruZRqwZtPcqDzws=;
	b=J4d4u6y9cpi/CLHKbGKx8U9MhICIC9Y96pkmWxNLWFGdJ3GmTw4ior1vLJduc1IteR
	W5njd8c5k7MKhtqdvpbHvnL4KpOZYG/nwiYpzigdR4Os+W1ChsQc1c0QyS6oKxtsrDcJ
	eDl0Be6BQuNSfw72e4rOhC3K41UzKY4akw6HuUgtrii0LesIh9raFB6fzudYgDgepDLH
	x9xYBNgMADbtL5qkYnp369Z7gRN4c1FnnjnjYwBuFGSnEA8Z27EesauaWVjk2jUf0aPZ
	eAmqbvXeMQLr+f7OUXqPExNzu7yZmaq2+tRZesqYr8gnEQdT3w6Y5E10iF34YROFNlFe
	yKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O7EE7F7IdeflaTPsiQTspkafhlHyruZRqwZtPcqDzws=;
	b=mAQzHOdkT6CfXz2Ih/ki0pUR4ROfvBCZtRB/i7NW2uXUjfM/cgPe33uhTEkx/kaTaS
	IqFBLK3YYQR02a/+5s+uz6I5NieOatxvv7OMiLGUFTZpYUnjGUdVqooNJmhkS1WluiDf
	75gRy0dDOqB5gWxSvhEfa5wM6anNQlY2I5zmGzjwf5mh6RpjRAzBdRNfDNNxixygPwiH
	rHSOXGvdxCNr4S4KjiRAoBTAU0fyQzuPQ1xhivpdmBAJl1EKHqSH0Z5Gqfs5jqTFFyNX
	uJg37+Ap3c4jFybhx7vOexAcSmvLspL5m1QjuCAwrWl+25DCSiXY7UHn+42znUTuY+2k
	UDIQ==
X-Gm-Message-State: APjAAAXa92y7GB+jbIRHBL5VHUa5GA/NiAckkhJSlaJN/78sL7744d0z
	jECF0kH+/vuXA4q4TuEvF2nHl5Q=
X-Google-Smtp-Source: APXvYqyl5u7HXlYP0yGH+NKXSVn+XNX0hqu9nLltwcIv+1YBkz5wpY8ks5SJtSRLtXHC3rCUCWOGgQ==
X-Received: by 2002:a1c:488a:: with SMTP id
	v132mr23522489wma.153.1581957580008; 
	Mon, 17 Feb 2020 08:39:40 -0800 (PST)
Received: from buster-jangle.bmw-carit.intra ([212.118.206.70])
	by smtp.gmail.com with ESMTPSA id
	s65sm1242289wmf.48.2020.02.17.08.39.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:39:39 -0800 (PST)
From: Viktor Rosendahl <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 17:39:34 +0100
Message-Id: <20200217163937.29925-1-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 0/3] Make lcov work with gcc-9
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
X-List-Received-Date: Mon, 17 Feb 2020 16:39:40 -0000

Hi all,

I have made this patch series in order to address the issue that lcov
doesn't work with gcc-9 because it doesn't understand the fancy new JSON
format. The last patch also adds a missing dependency
and enables the building of native and nativesdk packages.

These patches are intended for master but I can also send the series
for zeus, if/when acceptable for master.

best regards,

Viktor

Viktor Rosendahl (3):
  perl: Add libperlio-gzip-perl and libjson-perl
  lcov: Add support for intermediate JSON format
  lcov: Add missing missing RDEPEND and enable nativesdk

 .../perl/libjson-perl_4.02000.bb              |  22 +
 .../perl/libperlio-gzip-perl_0.20.bb          |  30 +
 ...Add-intermediate-text-format-support.patch | 898 ++++++++++++++++++
 ...Add-intermediate-JSON-format-support.patch | 247 +++++
 meta-oe/recipes-support/lcov/lcov_1.14.bb     |  11 +-
 5 files changed, 1207 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
 create mode 100644 meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
 create mode 100644 meta-oe/recipes-support/lcov/files/0001-geninfo-Add-intermediate-text-format-support.patch
 create mode 100644 meta-oe/recipes-support/lcov/files/0002-geninfo-Add-intermediate-JSON-format-support.patch

-- 
2.17.1


