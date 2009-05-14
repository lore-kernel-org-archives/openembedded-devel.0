Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M4cYD-0008I0-E1
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 17:08:49 +0200
Received: by an-out-0708.google.com with SMTP id c3so494119ana.30
	for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=DZtBwfP5/dmaQNJ6ItBxBjAA3UbuWWxoBYtTzSsLkmI=;
	b=h9Abc4WtnGfbzp/UQOMHuXgX6Y1tpDCD8G+S0u+s3x1TC0ECTAZoEkTHRAeMs9eStK
	le55L87du+lCLR6fNdzcKptOXfLJH5/LqokXOUf8AedQqE6gNMEJmn3MD7Zd12ESm0+c
	0g3TAz9/ClvikQl6PCRF9R8n80xlPM85w84iY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=fx/dfyxSW8Jm0WW1ydkv8DEUgFH1XXIecydqwLkP6q+vR9XyP0I9Wa9MFyLU+DTPjd
	AxWSH9p/oRj1JvvCE3dLXOZcl+vqG8FL4a3jpwjx2sQe/Lp3bxWIYHzObWtLKeSrB12R
	GytaUsd5o8zGTbQse5yrUQDmYqgoDSK4nHqiY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.153.6 with SMTP id a6mr2999648ane.89.1242313318484; Thu, 
	14 May 2009 08:01:58 -0700 (PDT)
In-Reply-To: <gudtn0$6om$2@ger.gmane.org>
References: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242152713-31425-3-git-send-email-marcin@juszkiewicz.com.pl>
	<gudtn0$6om$2@ger.gmane.org>
Date: Thu, 14 May 2009 12:01:58 -0300
X-Google-Sender-Auth: 7bb1b238ed07224b
Message-ID: <be7a9f3d0905140801w662c17c3p7fa9d2630dc2fe64@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH 2/2] patch.bbclass: use hashlib with Python 2.5+ - removes DeprecationWarning
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
X-List-Received-Date: Thu, 14 May 2009 15:08:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Wed, May 13, 2009 at 4:43 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 12-05-09 20:25, Marcin Juszkiewicz wrote:
>>
>> Patch.bbclass change removes DeprecationWarnings too but has to keep
>> compatibility with Python 2.4 so I had to use try/except block because
>> hashlib is 2.5+
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


