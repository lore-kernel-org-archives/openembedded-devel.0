Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsD-0004Rs-55
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:17 +0100
Received: from mail-wg0-f72.google.com ([74.125.82.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:31 -0800
Received: by mail-wg0-f72.google.com with SMTP id fg15so2521956wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=V914YE2+Qq4Xrv1VePX5VUENXGGjoNvVQXApUhkSZjE=;
	b=T8kAIAOXuDZtJfvSGTD0SyO4XNRZ5Juuvqk/05NtrRkzYoWEfcW8JE2UKfRP/lUpBB
	oOKTzSKPnvhGlS0jXwIO+aiTZbRPTPbGchC0Ntq3BM71WIwsf1ORPA3laesd6ttsTRMv
	eIBHXb0BdXAIZ59rT8pOlE5ufZGpVuRkthIR/AS8dk/CpJpI0+Vm8HMzt9CI4rLTZwYR
	Yb6x/D//DamGe1t+mfbM8/ZYixFkxi7bCyxxdeRoVAefRU9p0Db4trgGKNfROkrtj0dH
	cG9sovbAFCWHWvC/8wQI8aICvrqV+zKnbSpuiO9DsYdbqUAcj0lf0+5xUykr/GBAACz5
	Wt4Q==
X-Received: by 10.180.33.44 with SMTP id o12mr9829481wii.28.1356008069279;
	Thu, 20 Dec 2012 04:54:29 -0800 (PST)
X-Received: by 10.180.33.44 with SMTP id o12mr9829475wii.28.1356008069215;
	Thu, 20 Dec 2012 04:54:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:37 +0000
Message-Id: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQn1jR8b+ODWgwAl2pb/HV3+7tUNzu3sCWmALhtyDyCQMsvOjGMlPrjKifki7b8Llc2KnPsFk2zWOtnQMt6Xt2JiWHKIPGm7dnZqn8XMk6BQHbMqCiwzTAfTLN9VMB+nsICps/DveCVjXVMI6YAY2lEGbDYLmIaX6lBZr2yzup6cenjAqNo7PexGo2AP8CFtMLjpClq+
Subject: Migrate GUPnP to meta-multimedia
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 13:09:18 -0000

The GUPnP stack isn't used by anything in oe-core, and fits in better in
meta-multimedia.

Migrate all of the recipes, add some missing ones, and upgrade as much as
possible.

Ross



