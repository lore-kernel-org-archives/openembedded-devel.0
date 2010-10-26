Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAfZz-0003CV-3H
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 11:12:27 +0200
Received: by iwn42 with SMTP id 42so728001iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=l7Bu4cd70/yn7rM7V1a9vrX9uwHjvuiPMNjDzx1kL84=;
	b=wBEScz0siM2ujMlqL0y1nZ4nA4wYlHF1bynAIlX8Omee+kxmAC6QcK0g70RhPYjRTT
	yXwLzdf7TyoAC6lmAWAzE/HkFNPvkZS/s5cbxIQaXiGa26yYnt5RWu8/KNZzkWAMLVuZ
	2G/vb4DS50v7qP31BctJncf1Zd1x3/NH0VMMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kV4gOihSbgD+Kwv0nxMghLE4viRc5YnzH2whUrLt1CXmNgfRoduEW1iFOd6xPkJOpc
	bjGTFvGzoDbf7gHShHAydscapP+VUKthXYEZr2D6DyFj7h0SeM3SV+EfmCilBnYrksTJ
	zZryNzUOpRy1fCkK7Q5akiJLE57C5L8n9LGu4=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr6745185ibd.26.1288084277331; Tue,
	26 Oct 2010 02:11:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 26 Oct 2010 02:11:17 -0700 (PDT)
In-Reply-To: <AANLkTi=wO9jS-U8GZtnpHwbmb9Kmw-TvJY975wq2hnu-@mail.gmail.com>
References: <20100528052720.GA15949@gmail.com>
	<AANLkTi=wO9jS-U8GZtnpHwbmb9Kmw-TvJY975wq2hnu-@mail.gmail.com>
Date: Tue, 26 Oct 2010 11:11:17 +0200
Message-ID: <AANLkTinpze=4g7akMHofNEYX7wk9qfofyHJooNQ0cfHU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: <package>-static name conflict with some recipes
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
X-List-Received-Date: Tue, 26 Oct 2010 09:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/26 Andrea Adami <andrea.adami@gmail.com>:
> BUMP
>
> only a few recipes remaining.
> First question is, are those -static really needed? If so, then please
> propose a renaming.
>
> Regards
>
> Andrea
>
> On Fri, May 28, 2010 at 7:27 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>
>> I have seen that we have parallel recipes for some applications for static
>> build
>> called package-static.bb like below
>>
>> ./dialog/dialog-static_1.1-20080819.bb
>> ./busybox/busybox-static_1.2.1.bb
>> ./busybox/busybox-static_1.11.3.bb
> DONE > ./kexec-tools/kexec-tools-klibc-static_1.101.bb
> DONE> ./kexec-tools/kexec-tools-klibc-static_2.0.1.bb
> DONE> ./zaurus-utils/nandlogical-klibc-static_1.0.0.bb
> DONE> ./klibc/klibc-utils-static_1.5.15+1.5.16.bb
> DONE> ./klibc/klibc-utils-static_1.5.18.bb
> DONE> ./klibc/klibc-utils-static_1.5.15.bb
> DONE> ./klibc/klibc-utils-static_1.5.bb
> DONE> ./klibc/klibc-utils-static_1.5.17.bb
>> ./skype/skype-static_2.0.0.72.bb
>> ./udev/udev-static-devices.bb
>> ./udev/udev-static_124.bb
>>
>> Now they conflict with the automatic package that we generate to bundle
>> static libraries. Since the the packages which bundle static libraries
>> are essentially development packages may be they should be called
>>
>> <package>-dev-static instead of <package>-static
>>
>> IMO that will avoid the conflict and also clarify the package content
>> a bit
>>
>> Thoughts?
>>
>> -Khem
>>

I'm inclined to go to -dev-static for generated packages, so we can
have -static recipes.
One of the things still on my to do list is creating a static image
(to see if it saves space).

Frans


