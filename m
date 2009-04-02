Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LpQ3p-0002Es-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 18:47:52 +0200
Received: by qyk30 with SMTP id 30so1217240qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=1Bv7OTyQDKTgX1VyvckwRYEtRiIBxtUAqRB712f9mgk=;
	b=BN37bTS2FY7zRjklnqOBTmyv12cpbZAg8kwByLn+Cx93sqQAVuzmfGV//2oymrKCxb
	waC0H0T2SnxbsnDBGpHogmRiB0MHIKGq4YZGBV//Go8DoM2X9ImHbR/IAUBVHgtTJUo8
	hKrCzHSVlyZ17t0TqUnP+RU0EHAsUisK4IIQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ThYXcCm0XrhLuaD0HS9SUshTzk6qz6ak48+96/MvNJEIcrRVHZI6gijxcY0CE/SRbw
	AeLsAZNzXV0Eojd8kib3qeUYFq4Zo5Qy+UfQOVDtrNpMjZCmZtdXnzPjFQ87VyRcKJCK
	5FOTR/AU886W2cX+8N6CBONKfVV9fsfVEl4W0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.19.204 with SMTP id c12mr73342ibb.39.1238690649528; Thu, 
	02 Apr 2009 09:44:09 -0700 (PDT)
In-Reply-To: <gr1map$913$1@ger.gmane.org>
References: <87tz583wok.fsf@neumann.lab.ossystems.com.br>
	<gr1map$913$1@ger.gmane.org>
Date: Thu, 2 Apr 2009 13:44:09 -0300
X-Google-Sender-Auth: 1ea0fba97ee88780
Message-ID: <be7a9f3d0904020944q2e0456e7tae3fdbc89faa7a9c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.124
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFH] Ugly dependency on a locale package
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
X-List-Received-Date: Thu, 02 Apr 2009 16:48:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Apr 2, 2009 at 3:35 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 01-04-09 23:12, Otavio Salvador wrote:
>>
>> Hello,
>>
>> Today we spot a wierd package in our image and then we ended figuring
>> out that something quite strange is happening.
>
> Does it use do_split_package without specifying base_depends?

This is the evence 2.24 recipe, on OE git. It doesn't use it since it
uses the default locale spliting method I think.

I really see no reason why it happens but I've reverted your
patch[1] in our tree to keep our work going but I'd do prefer to
not divert if we can find the reason why it happens.

1. ebbcf0ebad3e98fd563cb66cb13b07c21d6d7a24

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


