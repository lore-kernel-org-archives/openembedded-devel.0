Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OT0FB-0001B4-49
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 00:22:29 +0200
Received: by fxm7 with SMTP id 7so362846fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jun 2010 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xL2tDlS7q1XM14z4EiwQs0aRvN8CFJaqT01q/Fu6544=;
	b=D9bbxSPhHNAvtSNhMHuZAI1cpAsGcsTBoJNd7ob4yECA7DmCAz/qEH1nm6hCv6n5Iz
	4s+VcTZASkShelT/gmDzvNzc/LfT7gAkSzyjFKVOhwchjZH9aU6VINCyCGDhIMdBOlMI
	apkuHJDIZJ5/t1nNL2bLbLd2RkRtMin10OMnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qiZ1wdTl706AKztxh/h82HmSoXWKqawmhCZlxzIg/GzzIfobJbjSisaOaXm3dhHmF+
	2I/Mt9iJIaboBGqeBgI/k9d/4N9FIuESwlzeoCDo/c2nQ4yHqwmqElnUF/ZTWePo1RfE
	+aOgEjxdpZnS9aUjLlKydgR94qcbZHzEe9QtE=
Received: by 10.223.116.134 with SMTP id m6mr1125226faq.61.1277677068145;
	Sun, 27 Jun 2010 15:17:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm43754782fav.25.2010.06.27.15.17.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 27 Jun 2010 15:17:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jun 2010 00:17:11 +0200
Message-Id: <1277677032-20016-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
References: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
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
X-List-Received-Date: Sun, 27 Jun 2010 22:22:29 -0000

Ah, I understand it now (thanks pb), feel free to revert my _${PN} addition or apply this 
patch if you find it better understandable then previous version, also skipping
${PN}-dbg.



