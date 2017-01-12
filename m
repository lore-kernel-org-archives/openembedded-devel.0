Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DE8DD60807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:44:16 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id j13so19691028iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=2TmrHZte+kyan9VNVmMMxc6XmCwj27EyzJbCRNr7xS4=;
	b=ej6RcbdJfO40gdyv3F4vH3lQzZI0bTz0e7SoQv5isS5YpKNlC+28cQviXoehUl1NpW
	fH+vRKWuWV0Fsx2eU4kqc8dte5uJE+PdqOOPQqXod7dU7c7/I0+/EWVNdE/u9mAxuXnp
	Ca6GVEomtGtzYnYWCMGorJvatxmcm9kjHawdjL/dr0GqnjBmlJMmGRwRnUYAEKfGcAaf
	2AykOjJ+NNbDBqCDlJnAaSkPg37MFZ8jFYljM15bseTGUMK2WGCBC4qsqhTf/5IgysbJ
	/l2x0CAslO5GNWdQ+YRR/KThURsUDS5mW4b7tmXMQpgf+A3pJLb2qXGGtZQZ3+vLnZPC
	DpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=2TmrHZte+kyan9VNVmMMxc6XmCwj27EyzJbCRNr7xS4=;
	b=OO+zgi1kak0CkLmUv/ZpbQcijx08xCAnmcHeIPyfh7nQHK2q2uIzCxhcJoEGqJh5tf
	3JsSvaR+h/SJx5ZMUKOgNnRrM7F96bLf0vvm+96P1wlE9L33mGCv/CXw0eNQvmmc5V9x
	CQD/b5Jr+58r1e6TXYZQ3QtpIo5QRsQGYJyZhlfDM7gSkybO6Oy6F4W0wkCoISU7JV/N
	fWtOPlBY61faZomfuaviNtexz+vkr4uqUJyLR8C8sBudj/3caDSGwzKIOwx2CZVJt7mg
	spdWSJIL83vaRhCVEpUKRSKIQwDBR4VcCg5f5aE3xalXAP3Y9PVot5d39nHICouDpJva
	YElg==
X-Gm-Message-State: AIkVDXKdhc79ZnR4XCNRKPYJxEn/IaLwug2xFK7o3Jg5rdm4lYIkamb1FoTflvyhSKZt6w==
X-Received: by 10.107.179.215 with SMTP id c206mr12749201iof.35.1484232256584; 
	Thu, 12 Jan 2017 06:44:16 -0800 (PST)
Received: from linux-uys3 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	a18sm1147665itd.18.2017.01.12.06.44.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 06:44:16 -0800 (PST)
Date: Thu, 12 Jan 2017 09:44:14 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170112144413.GA7854@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: meta-browser duplicate patch
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
X-List-Received-Date: Thu, 12 Jan 2017 14:44:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Does the do_patch logic now ignore the same patch being applied twice? I was
quite sure this was a problem in the past (and if it isn't, maybe it should
be?)

In commit fb4e542079958b6afde324a1e9bfdd695842aeeb
the patch recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch

and in commit c6fc9da7be64af7cd08c2bbb026e4c3ffc760687
the patch recipes-browser/chromium/chromium/chromium/unset-madv-free.patch

are exactly the same. Yet they're both happily applied without so much as a
warning, not even in temp/log.do_patch.

