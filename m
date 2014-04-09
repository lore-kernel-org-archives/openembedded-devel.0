Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B0F8D65E37
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 23:44:05 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so3093481iec.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 16:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QquUK6M54kKxO1tX9tycrh0qipeX55LGRbVaav37K6w=;
	b=KL2z/JkVWvyKhc+cOpZyFVqXRQIM6D72N9hy/MYw64ohK5ZG6qvt7+8a8NmQ7qndkL
	7sZLyM6375qSU5EdCUoSFtA7frQEUSHKmseMl1zI5K5JVcUrLSgavuxhcltzEEaVYZJO
	8gCVQepeGyG6edRoBToZVkG/Gm3mEpS9Et7z3WNvmKsZffQDbLBbb4c8HOfjELk1pneu
	wNPzVBT1rbX0hrmadoJue3XkhJOm/dK8p/idnc1WhGNkXTct96+BLjDVXvuAVHc4VWgG
	guuZ8BRP6o0si8cKZNdzjh7S+h8x/rNxl6lXGfkg08AMnvrtLJyl/oLlFlSOquyd+pfu
	m8PA==
X-Gm-Message-State: ALoCoQl7B/JXWaCRP0UAi0jJ6TJfQZYZvGU4v9LJxViR6SNqmXs5QALrqgWnt68VXF6RVJozi0yN
X-Received: by 10.42.20.6 with SMTP id e6mr9846861icb.29.1397087046155;
	Wed, 09 Apr 2014 16:44:06 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	nh12sm8733105igb.12.2014.04.09.16.44.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 16:44:05 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 19:43:58 -0400
Message-Id: <1397087039-21114-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Joe MacDonald <joe.macdonald@windriver.com>, patches@linaro.org
Subject: [meta-networking][PATCH] sethdlc: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Apr 2014 23:44:08 -0000

This recipe doesn't compile for a number of reasons:
- it expects to be built against a 2.6.x kernel
- its build is contaminated by the host

Given that these sources are over 9 years old, I recommend this recipe be
removed rather than spending the time trying to get it to compile today.

	gcc -O2 -Wall -W -Wno-long-long -pipe -I/usr/src/linux/include -I/usr/src/linux-2.6/include -o sethdlc sethdlc.c
	In file included from /usr/src/linux/include/linux/kernel.h:6:0,
			 from /usr/src/linux/include/linux/skbuff.h:17,
			 from /usr/src/linux/include/linux/hdlc.h:14,
			 from sethdlc.c:19:
	/usr/src/linux/include/linux/linkage.h:7:25: fatal error: asm/linkage.h: No such file or directory
	 #include <asm/linkage.h>

Trevor Woerner (1):
  sethdlc: remove

 .../recipes-connectivity/sethdlc/sethdlc.bb        | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb

-- 
1.9.0


