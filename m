Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzYol-00034e-AJ
	for openembedded-devel@openembedded.org; Sat, 25 Sep 2010 19:45:48 +0200
Received: by iwn2 with SMTP id 2so1560478iwn.6
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Sep 2010 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=tOlULEwcAIC7M0wytR6AviN3CK0INzVgmsESEsWJ3Uw=;
	b=xme0YbCp8yEyjKhWx7Tr23omOwOMFL7KUewRb9XsEQNYav0Ag9Gwez5MpudfclWHnj
	9SVhSYQWl2xW9b7ojCgQ3kGO3RNbspi7NEoC4Qh9LmjZq8mmU97EjeyNRpQ/tFhtO42b
	29pFs4YseDehATwDdEvyNj1uO3O8RTq5OaqVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dbQi8G25pOd0SYpXuLmH+izq0/1R8tn06GFjJARXRC6r+hk0AwDclJF2Vhg+QP9/0X
	wx+jHgbsypgIqvga92eueSoNn9wQvVFMTKNO1EanbXAlsS09D5dfXYDUnfb6Dq1gnbbo
	qLlV/NpF134DwBrw29yuo7WQ3/05J/k22xVFU=
MIME-Version: 1.0
Received: by 10.231.167.67 with SMTP id p3mr6055240iby.20.1285436739243; Sat,
	25 Sep 2010 10:45:39 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 25 Sep 2010 10:45:39 -0700 (PDT)
Date: Sat, 25 Sep 2010 19:45:39 +0200
Message-ID: <AANLkTinXgsJvySDfFADwQvLJSGJ3Ti_X9tJxxGs_+q2Y@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] lremove linux-uml
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
X-List-Received-Date: Sat, 25 Sep 2010 17:45:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Proposal is to remove recipes/linux-uml.
There are two recipes in this, and neither fetches properly.
Also the recipes are for very old kernels:

 linux-uml_2.4.26.bb  linux-uml_2.6.11-rc2-mm1.bb

It seems pointless to keep these (btw uml is nowadays in the mainline)

Your feedback and ack/nack is appreciated.

Frans


