Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAm8M-0005Zl-68
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 18:12:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 2C348314A2B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 18:11:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NM5IpZt9OGh9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 18:11:32 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id C6630314A176
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 18:11:32 +0200 (CEST)
Message-ID: <4CC6FDB2.6050401@opendreambox.org>
Date: Tue, 26 Oct 2010 18:11:30 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC6F440.10509@opendreambox.org>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3CFC@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0803110B3CFC@dlee06.ent.ti.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Tue, 26 Oct 2010 16:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/26/2010 05:51 PM, Maupin, Chase wrote:
> Isn't bash the supported shell?

Yes, at least on the build system. Some of the affected files are
executed on the target.

I understand that bash is a requirement for now, but if possible, that
should be changed. I don't think that root access to a machine should be
necessary to build OE on Ubuntu (or maybe even on BSD flavors). Does
Darwin come with bash?

Btw., I discovered the first occurence of this problem with bash on
Debian lenny, where wpa-supplicant unconditionally enabled madwifi
support, because == was used. Maybe under some circumstances the
bash-builtins of '[' and 'test' are not used.

> If I remember correctly in bash "==" will also work with numbers whereas "=" is only for strings.

Both bash and dash on my system handle "[ "0" = 0 ]" or [ "0" = 1 ]
correctly. Another operator "-eq" exists, which is only for numbers.

Regards,
Andreas


