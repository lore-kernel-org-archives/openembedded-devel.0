Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZL93-00016y-KO
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 13:35:49 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1041704dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 04:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=xAof8ccNCwt2fTB7JDVb7p4aBguXNcmf24kL8hLln+8=;
	b=Bp90ciVTDig3VrZuJEzPp4cj39HbC2/SkPcbl9dVK/079iZ9T/yfekxhQz4talnwkP
	NbeZn84UYH21QecSPzSDbeHRwbJ6N3DHgqDyJ0QgES1BYlHUVmTUjxFIbVCQvAQGuUV2
	SmwnK48Kg1MBo6yADzvXl5w7WyCen7mr9BuUpyszKMpsIfHTxIdL9PllY8gdTiMUcfZo
	zqxWPOXJHasDU7ny9FPx3ch9ZC9JvJcd61nRRo2QAGla5rZq9qXVlq//UlnQEoB9cj7b
	X99WkDPwwm8LDXXpsMyw5HK8gLkWnKxpHEVs9Jf32WKpr4HEMh5lnW+AOfIwKWLNQJdi
	mPVQ==
MIME-Version: 1.0
Received: by 10.66.87.165 with SMTP id az5mr12375197pab.46.1353068502775; Fri,
	16 Nov 2012 04:21:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 04:21:42 -0800 (PST)
In-Reply-To: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
References: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
Date: Fri, 16 Nov 2012 10:21:42 -0200
X-Google-Sender-Auth: B4T4wMe7FUsscI8_bxJ2JSQemtc
Message-ID: <CAP9ODKoX3=SV+Dei9s7NYUPtos_JtqewY_hi6ji2gEvYndfYPQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] python: fix for Security Advisory - python - CVE-2012-2135
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
X-List-Received-Date: Fri, 16 Nov 2012 12:35:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 6:53 AM, yanjun.zhu <yanjun.zhu@windriver.com>wrote:

> The utf-16 decoder in Python 3.1 through 3.3 does not update the
> aligned_end variable after calling the unicode_decode_call_errorhandler
> function, which allows remote attackers to obtain sensitive information
> (process memory) or cause a denial of service (memory corruption and crash)
> via unspecified vectors.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
>
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>

I think this needs to be backported to previous releases, right?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

