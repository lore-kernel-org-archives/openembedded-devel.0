Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LrCbK-0007wn-Uz
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 16:48:37 +0200
Received: by ewy20 with SMTP id 20so2417570ewy.12
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type;
	bh=QjOL7EzHWyxuxJoTx0LK3K44KL1FmlF76nBnrZ8UgRg=;
	b=uhX0+Q1jdKKBPH1Dv4xB0idk6MDmj7LJ5lAQ1/Ebjmp4kNj4aAnZBTwVwJawCrw4Nf
	V3ThQrr+8rveX0M88OpkbEbxtpyfiFRAfnfVrPwSLgvJG/YlNwbYaE6IhjZpsR4hQHds
	4Ae3QsDv0paT3GRJZISqP1N1jSoaxR+ykGdEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=CZ70xDpxqmP8TPBPihvka3+wHiNY7XxzL84g+H5msD6WY3ivcFJdgGmLBQCFE3lHVu
	vkhSIQlhymVP7j7rlCmLU6LzJpymT4IzyxXpyaReyjzYY9c7hvsNYSd9vyhw/gmvvmBy
	/GmPDJ/nudlUi2lRyrrzV8QrwJVjRTEKBuQ+8=
MIME-Version: 1.0
Received: by 10.216.54.198 with SMTP id i48mr48215wec.144.1239115536218; Tue, 
	07 Apr 2009 07:45:36 -0700 (PDT)
In-Reply-To: <grfm9u$l0b$1@ger.gmane.org>
References: <1239112078-29808-1-git-send-email-vhdirk@gmail.com> 
	<grfm9u$l0b$1@ger.gmane.org>
From: Dirk Van Haerenborgh <vhdirk@gmail.com>
Date: Tue, 7 Apr 2009 16:45:21 +0200
Message-ID: <eaa8e5210904070745u77fa5d94oc5486ddbda552ec2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: vhdirk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Added gsoap version 2.7.13
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
X-List-Received-Date: Tue, 07 Apr 2009 14:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thanks for looking at it.

I've changed everything as advised.

However, I am quite new to both gsoap and OE, hence I do not know how to
define FILES_${PN} more narrowly.

this recipe is quite similar to gsoap_2.7.7 (which is in the oe.dev repo
atm) in which FILES_${PN} as broad as here.

-Dirk

2009/4/7 Koen Kooi <k.kooi@student.utwente.nl>

> On 07-04-09 15:47, Dirk 'Virk' Van Haerenborgh wrote:
>
>> The patch is to make sure the just build binary soapcpp2 is used instead
>> of looking for it in /usr/bin in the staging dir, just the same as
>> v2.7.7 of gsoap.
>>
>
>
>  +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
>> @@ -0,0 +1,16 @@
>>
>
>  +PR = "r1"
>>
>
> remove that
>
>  +do_stage() {
>> +       autotools_stage_all
>> +}
>>
>
> Remove that (see below)
>
>  +++ b/recipes/gsoap/gsoap_2.7.13.bb
>>
>
>  +PR = "r1"
>>
>
> remove that
>
>  +inherit autotools
>>
>
> change that to autotools_stage
>
>  +do_stage() {
>> +       autotools_stage_all
>> +}
>>
>
> That can be removed if you inherit autotools_stage
>
>  +PACKAGES = "${PN}-dbg ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
>>
>
> That looks wrong, remove that
>
>  +FILES_gsoap-dev = "${bindir}/wsdl2h ${bindir}/src ${libdir}"
>>
>
> Change that to something like:
>
> FILES_${PN}-dev += "${bindir}/wsdl2h ${bindir}/src ${libdir}"
>
> And define FILES_${PN} more narrowly.
>
> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

