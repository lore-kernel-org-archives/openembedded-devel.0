Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LKIzN-000814-1s
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 21:57:25 +0100
Received: by yw-out-1718.google.com with SMTP id 5so2765479ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2009 12:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=rzeNHOd/275fjziw5G4g2nE5qudBI/EYoo8MVHkvEZM=;
	b=xv+tHX2AUY9OzNZHiA1BYg0LfPUwt4iCmZDGCR7a2/cyvqZUUmj1ed8wsv47bjsk5y
	uWX8jBEJJxi6QBf8h6kV8oNj915Ow31Jal9HCYu3M61mio54z0rpiyKubcbH7HPXULMd
	3kcqYcPv0SGbGq583tW4zjIGQei5oHVXtZeo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=L/JKZoHvWF4cU7/c9pdshvYv0OOgTKAFT3h1kITVXdksfwInCZglAUAHH9EehRiuTY
	WtgW1n+l7AJN9Pt17c7K3HCHELtiuM13VWAEchsIhm2LxCmZZIGW6E8EQgj6PD2eOEkc
	ksJQSVx6ltfZDvDtmKM48bt0137+Y7NlrhUNU=
Received: by 10.100.174.13 with SMTP id w13mr11969230ane.141.1231275083505;
	Tue, 06 Jan 2009 12:51:23 -0800 (PST)
Received: by 10.100.106.3 with HTTP; Tue, 6 Jan 2009 12:51:23 -0800 (PST)
Message-ID: <d2b9ea600901061251n67c641a4ie03b8a552f3c4990@mail.gmail.com>
Date: Tue, 6 Jan 2009 21:51:23 +0100
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gjtg1m$rsd$1@ger.gmane.org>
MIME-Version: 1.0
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
	<gjtg1m$rsd$1@ger.gmane.org>
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native and sdk recipes)
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
X-List-Received-Date: Tue, 06 Jan 2009 20:57:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 5, 2009 at 6:29 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:

>> I'm sorry, but this seems like a dangerous way of starting confusion of terms.
>> MACHINE in how I see OE is really the _TARGET_, ie. the small device this all
>> is targeted at.
>
> MACHINE is where the generated stuff will _run_ on, so MACHINE=x86
> SDKTARGET=armv5te would be more in line with what OE expects, but I agree it
> can be confusing if you are thinking in autotools terms.

Exactly. Let's stick with the solution that applys best to the golden
"Rule of Least Surprise",
which I believe in the case of the average OE user would be as Koen suggests.

/Esben


