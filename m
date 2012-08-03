Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxMy9-0004qs-DE
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 20:51:29 +0200
Received: by qcad10 with SMTP id d10so641082qca.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=FlVIr2wecQ7CsrKCU6sZw2gNcTa7LRCkrK396wI1Bqg=;
	b=xCqZzStxZtqVsH+QIRZREFFq45akSLQsQnbV6RRpQCI5RkO8FOHgDifHRrrpZNseon
	f70Zr3IV+txUaSzAne4BAC2QurUf5v5BgZTUcB8sTDljbXONlZRgJ+6O0cArZAUEvBjv
	9epdEqvhR7hS34hC+7fPDU0niUjW3kgN/BtMqoctxDiiGQPpOZGvHQvb6PAeILEtZAs4
	EdVYMuuMhV2KjSGBAU8fF5JAVeFEcvONAjz3q78SGGFDS4mx+7CjJQr2Gk0tZL/ikwXt
	/0+xtnSPxeaLmsrCBtg8z9vg61PKpD1Cw83Q/5cBgckiLO6jK8xF3BB1pbHHPDhn9Kuv
	QodA==
Received: by 10.60.22.5 with SMTP id z5mr7181711oee.2.1344019187298;
	Fri, 03 Aug 2012 11:39:47 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id l9sm8453838oeg.3.2012.08.03.11.39.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 11:39:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <jvgr60$ig7$1@dough.gmane.org>
Date: Fri, 3 Aug 2012 11:39:43 -0700
Message-Id: <E805BE26-25B7-4EC5-80C6-4200151E1DC5@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1485)
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Fri, 03 Aug 2012 18:51:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 3, 2012, at 8:36 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> . However, my original motivation is to make this layer independent 
>> enough and remove the layer dependencies it has It will make both layers
>> thrive IMO. I proposed removal of using gitpkgv you did not like that,
>> then I proposed this to remove use of SRCREV completely this also is
>> objected on. may I ask what other option do you have ? I am willing to 
>> make a solution. Ultimately this will make systemd integration into
>> OE-Core as reference init system easier.
> 
> Move gitpkgv into oe-core


will it even be necessary with autopr ?



