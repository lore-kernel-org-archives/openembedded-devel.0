Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NhLCr-000741-K0
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 12:03:08 +0100
Received: by gxk7 with SMTP id 7so8538123gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=+HJ1lggx62FFGqHINVErgbHEZt1FC5r5JUYumuIEHbE=;
	b=ADlA1LbzL1HuH5MBJgh4xMwjIXPD5wg/HOJ5LGMolsdc2b4zWqsyxaPiJTni6cMANI
	//eFZD/GS+ed/1y58hAp5NsbATorOL5TwF4W5yT5jiH9pD4ccX03jS4zcI6FC2Ne63DC
	6pf4PQ/I7aNi/skEBiwMPO/jaL7dx/ggJdmSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lXLVwyC5oIefs2zABbVxPvO0uM+HtC3a9kvIFqkC0nK/o1eIL+5YX5zj03hDoVQeNG
	V3dDLRfBfgYNRs9olCsuXROCP/ftFAR1Pxbxhy0sRTUeDzOaLOxoblslowD5VvcJ6F/3
	Q9vd8SicsZoQzrw8hgQUmSuVvXh2FqVpuord4=
MIME-Version: 1.0
Received: by 10.101.155.13 with SMTP id h13mr3960002ano.220.1266318024937; 
	Tue, 16 Feb 2010 03:00:24 -0800 (PST)
In-Reply-To: <ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com>
References: <1266316492.6436.127.camel@rex>
	<ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com>
Date: Tue, 16 Feb 2010 12:00:24 +0100
Message-ID: <ac9c93b11002160300o228680can58d07e6fbcd7973f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Tue, 16 Feb 2010 11:03:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/16 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/2/16 Richard Purdie <rpurdie@rpsys.net>:
>> Hi,
>>
>> I've been thinking for a while that our "look for a conf/bitbake.conf"
>> approach to finding our configuration is rather dated and inflexible.
>> Talking to others I think they feel the same way and its time to take a
>> step back and think about what we actually need. I've tried to do this
>> and I have a proposal based on what I found.
>>
>> The fundamental problem currently is that the build directory is not in
>> control of what bitbake does. We require BBPATH to be set to some magic
>> value, find bitbake.conf, this transfers control back to a single file
>> (local.conf) which then further influences things further. The build
>> directory has to be combined with the right BBPATH setting.
>>
>> Furthermore, we have the powerful overlay extension mechanism but when
>> adding an overlay, you have to change BBPATH, BBFILES and a load of
>> other things to correctly integrate any overlay into a build.
>>
>> So taking a step back, what's needed is for the build directory to have
>> the basic configuration contained within it and no need for some magic
>> BBPATH. Overlays should ship with configuration information attached to
>> them.
>>
>> I therefore propose that before conf/bitbake.conf, bitbake looks for a
>> conf/bblayers.conf. This file sets a variable BBLAYERS.
>>
>> BBLAYERS is simply a list of overlay directories to include for the
>> given build directory.
>>
>> For *each* overlay listed, bitbake will then include conf/layer.conf.
>> This is the main change in behaviour for bitbake since normally only one
>> file of a given name would ever be included but I think this makes sense
>> to give us some new functionality.
>>
>> These layer.conf files are free to do whatever they need such as adding
>> paths to BBPATH, BBFILES and so on (I see new variables being added
>> which is to be encouraged e.g. extra site files). Experimenting, its
>> obvious the one thing you need in a layer.conf file is the layer
>> directory name so I've let bitbake set this in the LAYERDIR variable.
>>
>> LAYERDIR is a tricky thing since you always want to do immediate
>> expansion on it since it will change later. This is going to catch
>> people out but so be it, it works really well.
>>
>> The nice thing about this approach is that its in keeping with the way
>> bitbake works, but its powerful and easily extensible and uses the
>> existing configuration syntax, parser and so on.
>>
>> I wrote a patch for Poky illustrating how this thing could be used which
>> is included below.
>>http://picasaweb.google.com/fransmeulenbroeks/Fosdem2010?authkey=Gv1sRgCPfSh7qcjv2siQE#5435938102383709010
>> Its also totally backwards compatible. If bblayers.conf doesn't exist,
>> it uses the old behaviour and you can mix and match them if you're
>> careful too.
>>
>> Does anyone have any feedback on this approach?
>
> Sounds quite nice.
> Didn't study the class code, but it would be nice if within layer.conf
> I could use a relative path, which then is turned into an absolute
> path when the layer.conf file is read
> That means layer.conf can become very standard wrt BBPATH etc. and you
> can even move layers around.
>
> Frans
>
Oops apolgies for accidently pasting in the link to my fosdem pics.
FM


