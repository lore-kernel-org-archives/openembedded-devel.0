Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 98A2C7FC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:42 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id b137so27085067pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xy9xzTnOJ6KkikHQxsJ1gzgU/Ey8fDAohwSAxet6Z9U=;
	b=GdNIFMuDjX3r772Uav1e6TeO1fC3KkRJi0xOYTUL46CnOcJ9R/LWuFDbA/immrMA4Q
	M6EcJD4PE+xVdwWdFBwZjK2/Wispj7iF/JtuF2eCMPYbfrAM4w3rrgEj69ie/4FzD2C+
	QhHJFJDUr/0KwDU2LvVZ6vPC9/T71GNKlGK5Tz9tZAG4H4x3TdAns9BsVWzXe1bIj2zO
	kM1dJm80CRhdfM5Fuld1tb7tabIuRFnnwucrrAjULif35pXX28yvI7Dgdk2vrvO7KYwk
	rhs6gAx0xJNEEps828ZyAFa5VgkhFbaPCEZ3pp96YJIsa/xj/2tNAy4btK+7hQ8Fz0tB
	xMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xy9xzTnOJ6KkikHQxsJ1gzgU/Ey8fDAohwSAxet6Z9U=;
	b=BrssyeGe6wDAeXoF6ovic9Hk3J6FNebQg/qeI6OJmpzjbYx6x2s5/w7rodavAN6may
	icgLXOh6Gqh12tTtj5YX4JrVqwJn2W3PZykLiXxp3vYsAAxh0g1ODqcBGmEDIRALsWiI
	7oiOfmU3Zqx44wwKP502QrwpxU+fZIWQX4RAsxI+DQm08bP0mIptGn7zphg5nvV0dPty
	TANN+18b6KHa08kftsLqRoJSez12Y/fC0Hj/d96xSeyZbP341JKiS9rdPi4YUmfPLnXy
	0hKjzj7L2TFUkTre2TYztmkeHSVdXgOpDPpaC9QO27QXwLDxC25aFNwQ4r5bdv8Ny6X/
	vo+w==
X-Gm-Message-State: APjAAAWjIlvdaRnaNdQ9VQ5LbfPu5KTd4A9KU6I655C5wUq15ZkfvdmZ
	kdAvOoGfvmrovZWwVZiusWqs5Pb2
X-Google-Smtp-Source: APXvYqy4WYwidJ6YPLhYpvxPEaUCHGrjzOaIxWc5ucffj85PZNCAFBFLstegI2J+z1TtrY6bUsegcQ==
X-Received: by 2002:a62:148a:: with SMTP id 132mr47283011pfu.158.1578327643437;
	Mon, 06 Jan 2020 08:20:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:14 -0800
Message-Id: <0aee83e4e31dff7f4354e4eb4cbd35dd592e9f06.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 06/25] siggen: Ensure new unihash propagates through the system
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:42 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its possible the new unihash may not exist in sstate. Currently the code
would create an sstate object with the old hash however this updates it to
create the object with the new unihash.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abcaa1398031fa5338a43859c661e6d4a9ce863d)
---
 lib/bb/siggen.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index de853268..dbf51023 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -513,6 +513,7 @@ class SignatureGeneratorUniHashMixIn(object):
                     bb.debug(1, 'Task %s unihash changed %s -> %s by server %s' % (taskhash, unihash, new_unihash, self.server))
                     bb.event.fire(bb.runqueue.taskUniHashUpdate(fn + ':do_' + task, new_unihash), d)
                     self.set_unihash(tid, new_unihash)
+                    d.setVar('BB_UNIHASH', new_unihash)
                 else:
                     bb.debug(1, 'Reported task %s as unihash %s to %s' % (taskhash, unihash, self.server))
             except hashserv.client.HashConnectionError as e:
-- 
2.17.1


