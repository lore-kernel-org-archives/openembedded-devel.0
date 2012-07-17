Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SrBd1-0003iQ-F8
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 19:32:07 +0200
Received: by pbbrq2 with SMTP id rq2so981313pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=lB2PCqvLgz3foGdY90Ql+vlaTKe1yqiz61i53xAkR7I=;
	b=jStIG2po+LpfTwOnoFzyJJ768Xqjc4XWildVkbFj9NKyd1DvA5WrwIzG9zGFJBYqnS
	KfKedhUFQdTqo1c//ZyaPuHMzfmVgtbsBZo3aidjX3bdHFIG4dHQUoVIPIRuQjwsMyBZ
	Bq++NWhi5/T7PdfloMWcydA+LqKPhOur2MRQqXs+I2pniucPG25qIT2bH9kVl/KN+TfK
	qzQ5T7BOrTm5sa8r0rRGBJ/+5WrNQv1qQATZDUJ8ymoDRVamxgDv81Y2ncko+b5WOcEq
	Ldl0UmX2XtlWOw+8nOz8w+FfLfGd0FBpRtYnDSCQ+ZEOqLRx8KIwchTd8ceLdTEhTNPq
	aWeA==
MIME-Version: 1.0
Received: by 10.68.212.70 with SMTP id ni6mr441493pbc.22.1342545646771; Tue,
	17 Jul 2012 10:20:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Tue, 17 Jul 2012 10:20:46 -0700 (PDT)
In-Reply-To: <9a4427b73e6410ee3c7d194a38225a54778fffae.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
	<9a4427b73e6410ee3c7d194a38225a54778fffae.1339428767.git.otavio@ossystems.com.br>
Date: Tue, 17 Jul 2012 14:20:46 -0300
X-Google-Sender-Auth: C977NBGOPhysraaWY_P_Xe_que4
Message-ID: <CAP9ODKok3_7cHR39ru-A2CKX1jo7L7+WMFX_NZ2Woi84M2zuyQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH][meta-oe 3/3] cpuburn-neon: fix packaging to use a date as version and valid sources
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
X-List-Received-Date: Tue, 17 Jul 2012 17:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 11, 2012 at 12:34 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>  * The package were not versioning the sources as the files had no
>    version on its name. We workaround it mangling the DL_DIR;
>
>  * We now dynamically check if the machine has or not neon feature and
>    set COMPATIBLE_MACHINE.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Koen,

Can you apply it and queue it for denzil as well?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


