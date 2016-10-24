Return-Path: <twoerner@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id AD34A606B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 13:43:06 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id s8so99489941pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZW0e4Tk1zOOfFNZD6zokjOtHdOqEpoSoZypdCFNZ7vc=;
	b=RorlDjOzI1tLSzPqh8Qo2L1vcgGSs4nXUO5cOdqaGRPP4Amjq6aJgpRiXgVAuWGRsC
	V7xNIzqEthv8iuq2lCFSzQzb2eOYbeYh4oM+wPCd9/WheQ6dEBDnLNlj2etGSnvFsIBV
	Of1YSBaOzXk1INHLfFaSzdfKognYiOz8j2oZaeUPPUoiGMkxwkrS9GS0wLG0vQca1bXl
	GWbMbE1tdUynChpPLhfIwKJOLXhP5HyQ+Vhl2mTSKj9432eGsMiWJ+jku+sa3HOmFpnH
	aFpzpNZHZGPV3faWOXeM7LVZbqYzc/XzcQ+jGxWviePe+oRArF9SCsNe7opM3RASa9zH
	cfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZW0e4Tk1zOOfFNZD6zokjOtHdOqEpoSoZypdCFNZ7vc=;
	b=gGoOjZjgFVfgReszvPDXokMUzE3N0fp2eURvsQiu4OJASsD55aO1Xa45stJCJ9dTTi
	IiTHPV3jdh+Ituu0n8vCtc4cvq6LPxPO4U2D87n9ue26TxvJq41pnygPPg1mU6qUESRC
	O5IugC7iRaAFqNnzn6jO/g+lh9iCOvmdJ45AhhLL3Gc19TiqA1+7UIg9cMkpnpvmVRv1
	+veoSQdjFz+Wx8gmgGJUDZeq/tvaUAUaDqs6RnGd/r61rzxS0qU0OtDrzH/h4rQkX9Ns
	kpgcNDs/tgw+aIbnGPoibXP/hvQPqjy0U14v9oIwIOhOnJSoGobnYJkSQaW5gMA5Tktb
	8zJQ==
X-Gm-Message-State: ABUngvf5RQu6c0hEaYaubPvTXiE2hxnkV94iBagVSbx7QBfVCRANokirFQhozPX5VNUHlA==
X-Received: by 10.36.17.17 with SMTP id 17mr2117052itf.4.1477316587458;
	Mon, 24 Oct 2016 06:43:07 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g72sm1385444itc.5.2016.10.24.06.43.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 06:43:06 -0700 (PDT)
Date: Mon, 24 Oct 2016 09:43:04 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20161024134304.GA31203@openSUSE-i7.site>
References: <16076428.LW6cBLIOWS@localhost.localdomain>
	<CA+chaQd4_k4HPKqOzn-DSL92EM=UCejFpx87==0ub+aR8AE39w@mail.gmail.com>
	<20161013142338.GC2924@jama>
	<CAHUNapQ39pXD4sjxQHgRFmq-GGLbZbBgQ6jVYKTsL2A7rzpLfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapQ39pXD4sjxQHgRFmq-GGLbZbBgQ6jVYKTsL2A7rzpLfA@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: otavio@ossystems.com.br, Davis@openSUSE-i7.site
Subject: Re: [meta-browser] Chromium Doesn't build for 32bit targets.
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
X-List-Received-Date: Mon, 24 Oct 2016 13:43:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I have been able to build and run chromium-52.0.2743.76 for qemux86!

I'll be pushing a patch for this issue soon, but I want to do a little more
investigation beforehand:

1) I discovered, a while back, that chromium won't run on the Minnow (x86-64)
unless I also use glibc-2.23. Therefore for my tests on this issue I switched
down to 2.23. So I want to switch back to glibc-2.24 to see how that works on
qemux86.

2) I want to make sure that my patch doesn't affect x86-64 (i.e. what's
currently working). Otherwise I'll just have to make the patch conditional on
arch.

3) I want to investigate bumping the chromium version to something newer to
see if that might fix the issue too (otherwise, I will investigate bumping,
but not as an activity related to this issue).

