Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwyYk-0005na-0N
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 15:01:46 +0200
Received: by qyk30 with SMTP id 30so1061796qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=D9BCHe05TtJjUyRMkI6lNXknmQQFrPqUhS1dVYegnIc=;
	b=gi5vMExS1RHmdSEMfb3sJzKdcrUyI0Con9m2NBsNfCPMDOSwDpm/PalExnQZmGk9J7
	N/cTOU+c+DI9I6tdQ3X60GbtJrcudMLVfLezRxGntHkGLjoXIxM4X2GNd9m8tFRc8IQM
	SdcMVlher4lAnak0gpFC5zk8mFtFEUQicC/QU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=JD/cl9lhRCYc0q7mS/2gcLf3Jg5/1GWdLCTPdRR9zbkTNKoYG0BTzbzqfPpdwIGrwx
	69iUPFMTKWEiqNHPY3fiYmGHgomEHy3lGbfuMQiwbBGTBDiMpTZc5L03m8qT1dqDWQ3I
	qmiowNzYJVsS/7ZX6miYvZfY/t1yzppdQHn0E=
Received: by 10.220.76.207 with SMTP id d15mr2166093vck.31.1240491426275;
	Thu, 23 Apr 2009 05:57:06 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm2082780ywn.25.2009.04.23.05.57.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Apr 2009 05:57:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 4F36461006D; Thu, 23 Apr 2009 09:56:58 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-2-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
	<gsp1t1$9fq$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.92 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 23 Apr 2009 09:56:58 -0300
In-Reply-To: <gsp1t1$9fq$1@ger.gmane.org> (Koen Kooi's message of "Thu, 23 Apr
	2009 08:29:53 +0200")
Message-ID: <873abzedet.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Thu, 23 Apr 2009 13:01:46 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 23-04-09 03:17, Otavio Salvador wrote:
>
>> -GLIBC_EXTRA_OECONF = "--with-tls"
>> +GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
>> +SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
>
> shouldn't that be _pn-glibc?

You mean the SELECT_OPTIMIZATION?

> And shouldn't you make glibc geode specific after that?

Sorry, didn't get what you mean.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


