Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nk3uu-0007Gx-JE
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 00:11:51 +0100
Received: by iwn9 with SMTP id 9so3828916iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 15:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=L7QLcClzKhpDPuwPcmgubH6w7BAXt/sEZe9upccSgOk=;
	b=n0aJ5ioVv/NUkjm2Xhjs0LBbqXuxCUNZtNFK8btuI61u7NMzsbzMIzFbkah2kYYzOh
	RjrIpm53ocuVU44zgAJhcSULsDnOG72gYOdu61fDEzVoIDnqJbwz6JDzzi/eHKXqL0oS
	us4jlhfNQJgkNfcv07pXYIpyeL2CFQpWbXzhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MaZ2wX2MBiK8mEPZqfmEofN0+H9BCBsPUojzMIf8IdcwPdXlufAogT14sbo5yiYUT1
	IcrjPxTJZLfxJktNXPYg8LMe+5ohu0pdTXcMRJX2OY8WpgZABiTzXqTmDeVvmDdg9vxH
	RB/BGzTX5iO4TgKjiUDAXDciETCcHdpkYcb9w=
MIME-Version: 1.0
Received: by 10.231.151.207 with SMTP id d15mr1272082ibw.44.1266966542880; 
	Tue, 23 Feb 2010 15:09:02 -0800 (PST)
In-Reply-To: <4B8458A7.40807@balister.org>
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DD5C.8050408@tycoelectronics.com> <4B8458A7.40807@balister.org>
Date: Tue, 23 Feb 2010 15:09:02 -0800
Message-ID: <19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to build g++ to run on target?
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
X-List-Received-Date: Tue, 23 Feb 2010 23:11:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister <philip@balister.org> wrote:
> On 02/23/2010 05:51 AM, Jay Snyder wrote:
>>
>> I was able to build gcc for installation directly onto the OE target
>> with "bitbake gcc". "bitbake g++" gives me "nothing provides g++".
>>
>> What is the magic bitbake command to provide this?
>
> bitbake task-sdk-native, and install task-native-sdk. Anyone know why the
> task creates a package with different name?

may be because

task-sdk-native.bb:RPROVIDES_${PN} = "task-native-sdk"

>
> Philip
>
>
>>
>> Thank you,
>> Jay Snyder
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


