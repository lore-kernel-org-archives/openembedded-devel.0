Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2qDu-0000dh-29
	for openembedded-devel@openembedded.org; Sat, 09 May 2009 19:20:30 +0200
Received: by an-out-0708.google.com with SMTP id c3so1074232ana.30
	for <openembedded-devel@openembedded.org>;
	Sat, 09 May 2009 10:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=JzOtj57m4Criv95vngn5/ELeMEoztKgd4snpK2IlXnc=;
	b=Q/w2+z2gOSL+2tlqnU4tdzagaxNNznqhbdKS5wCK3oSjdndA0BL5yrMtvggNvF8aRa
	ipLYbeXtdVP+4r9HQXDh83I+sBMBUAp0LFtxIOAT4YQkGV4/XK34jVKCgqUxWAbQJ29f
	SMZNZ2RZ5aCIrXc7sSb98c4McKcCRNsfueURs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=VvVwS0OoG40YLOKIssTQ5+DjvWeLsOBjG02u+VGt8A2dXHbuPJm1Aq9UbXz08mnEc4
	MS49T2DBAOw4gz/0VsNmi2ZHUDw7I2LYCX0N5JgbrB4O1vLKmqCsc9zYHsvEF9Wkf1jH
	eX6FOGDvsPJwyP9hx8bHQyXG3hSEdNwPtMqLM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.47.6 with SMTP id u6mr5366666anu.97.1241889250133; Sat, 09 
	May 2009 10:14:10 -0700 (PDT)
In-Reply-To: <gu3cv5$7qi$1@ger.gmane.org>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<gu3cv5$7qi$1@ger.gmane.org>
Date: Sat, 9 May 2009 14:14:10 -0300
X-Google-Sender-Auth: 40508745aaa6cefa
Message-ID: <be7a9f3d0905091014xd77e35do3b7f213d9d87aff0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 09/23] system-config-printer: add to provide python-cupshelpers to hal-cups-utils
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
X-List-Received-Date: Sat, 09 May 2009 17:20:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello

On Sat, May 9, 2009 at 4:56 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 09-05-09 02:50, Otavio Salvador wrote:
>
>> +PACKAGES="python-cupshelpers"
>
> Overwriting PACKAGES is always a bug.

I did it since the recipe idea is to only provide the helpers that we
need for hal-cups-utils, not a fully working system-config-printer.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


