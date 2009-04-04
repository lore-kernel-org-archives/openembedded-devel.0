Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LqCMd-0001cL-Re
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 22:21:18 +0200
Received: by bwz19 with SMTP id 19so1364560bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2009 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vRfCxhv7ebBK3Gnlp/b7VylbDw2yJ9fb+nkKFy3pRbE=;
	b=qBdNsyRXQAjWuYIEM+iEtlfcdHmMYPMPlcB3uWxu85oFCIE+p6pl7FYWkVdRC/c0FV
	X9nhbxvyDuLEbrUWI1W/rPRvq0H99EtDBG46sWa54u6wFAvj0N0nlgN+L+2UjCRG0Smv
	BqFGwFPng3HIxnV01wGtU2VjsXRA9u6b5eVzQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IivNvRm6vg7+3geKU4S3Q5zd7WejzJC0szjl10GC/UiXlwlY3nCcugLfA3zVIUd3Y6
	BK7Wfq88Tzxj0IYC8eOmaP67zlTo/YvnD3hW9iZjFtiVxPWqraM6tta3Q1HNj09IPQnc
	z/ZQkMey0eZD6yF1VM3iHKaWHROEABXscZTIA=
MIME-Version: 1.0
Received: by 10.223.110.3 with SMTP id l3mr2242525fap.48.1238876314046; Sat, 
	04 Apr 2009 13:18:34 -0700 (PDT)
In-Reply-To: <gr82p7$2vd$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<ac9c93b10904040851q4d038367l7ac1d4e80a52dfc4@mail.gmail.com>
	<gr82p7$2vd$1@ger.gmane.org>
Date: Sat, 4 Apr 2009 22:18:34 +0200
Message-ID: <ac9c93b10904041318hd16998cg77f19e0e9196f25f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Sat, 04 Apr 2009 20:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/4/4 Koen Kooi <k.kooi@student.utwente.nl>:
> On 04-04-09 17:51, Frans Meulenbroeks wrote:
>>
>> Hm,
>>
>> I don't like that one needs to touch conf/machine/beagleboard.conf
>> each time the kernel is updated.
>> This is likely to be forgotten at some time.
>> Can't we use something in the linux-omap-*.bb file ?
>
> You can't set global vars in recipes.

Thinking of it the real issue is that we do have DEPENDS that takes
care that if A needs B, B is build before A (and I guess that after
updating B a bitbake of A will result in a recompile, even if A's PR
is not changed.

Maybe a solution could be to be able to rebuild a package plus all its
dependencies (the information is there in the DEPENDS lines).

Frans.


