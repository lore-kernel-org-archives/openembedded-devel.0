Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pzkrz-0006v1-Iu
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 08:10:11 +0100
Received: by pxi1 with SMTP id 1so335506pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7ELGpGCD6cPzdP+MJV5cm7HNXNmAypO8Quvryco4QKc=;
	b=t/rtVAK6l76pE3dVp2ImlHxJRrnxkYgCpB3cfwxFBr8Gpp9RzdXQ6NY99NTmLJyzXU
	Lmp2lkQpnm9bfIbcCKmbnBNB1+5/9ViMfRv7LrZgW3AtNXnHrgf1yGjh7P8/sClGvNod
	0go+ttjoAS+07OwfaeQdz6Qh4e7JipWJbSHts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=EQn/iIMjZj6UJHN+8IqNusUxUX1izJ3bcA1H7yQwfSOyOfEi9mdHTnbadfqObwk8fI
	/gSSUcOKzcgRiXAiD1+pI0RYxYnReBDecvDn5j5f6yn+5P9OMgl041EQFhSHzqqhhmQr
	KxpgfdkI3dEzJ4Sy4GNgCLfKN/CcJ/vFHgTvo=
Received: by 10.142.47.2 with SMTP id u2mr375961wfu.250.1300259307827;
	Wed, 16 Mar 2011 00:08:27 -0700 (PDT)
Received: from [172.23.0.199] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id w19sm792142wfd.8.2011.03.16.00.08.25
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 00:08:26 -0700 (PDT)
Message-ID: <4D8061DE.6030106@gmail.com>
Date: Wed, 16 Mar 2011 00:08:14 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de><1300180117.2522.14.camel@eha>	<20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 07:10:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
> Hello,
>
> I was looking at the libxml2 package. While going through the recipes I
> came to know that its native package depends on python-native package as
> well. This dependency is defined in libxml2.inc file.
>
> DEPENDS_virtclass-native = "python-native"
>
> This package build fine after removing this dependency. I am not clear
> why this dependency is being added in libxml2 package. Can somebody
> clear that to me. While looking at the git log I came to know that this
> change is coming from libxml2-native.inc file. But I am not clear why
> this dependency was added as this package build fine without it.
>
> Please help me in understanding this dependency. Thanks.

Try to build this recipe from scratch and see if it still works then we 
can remove the dep
>
> Regards,
> Noor
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



