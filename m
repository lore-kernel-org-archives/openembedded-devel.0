Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P5ygo-00049W-59
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 12:36:07 +0200
Received: by ewy1 with SMTP id 1so1522500ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 03:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=BOjAM7loIUJRL7kF6Q9SBX/wdEbpSN9qDdvcTwwaQ0Q=;
	b=NeIiCWPBbAJ+DTfsVCG0i3pIHnbCBH9JaGIXXSxhISs/tiEpmqBz0reheF0zVENDop
	Cx1+MUnmjiV9a5Ev86e1WSUetW8XP0mpuz51f2iEnym7c67OmlyEm+kTUdPu/7FO3Kpp
	b4Xtg8WrSpRy6TeIzi7RluF7Jp/FGeobyxR0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ZvA6UAhCWv9mlekfKdWD9/Tb/lFO8UlNwz6uEiYbe1z25mP2v3drRKrei9lD8kaieM
	qSTHkDNkVJcBwGRDyGL/fmQVcmmj9xcaEhBAA1rlerFvthqWF9iPhEpFdhmNYMMrmvr1
	DiJJoKduoxRDn/diaQAVV/HYE2jBKpzGX1azk=
Received: by 10.213.19.19 with SMTP id y19mr2408158eba.65.1286966138580;
	Wed, 13 Oct 2010 03:35:38 -0700 (PDT)
Received: from [192.168.0.40] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id p53sm7260226eeh.19.2010.10.13.03.35.36
	(version=SSLv3 cipher=RC4-MD5); Wed, 13 Oct 2010 03:35:37 -0700 (PDT)
Message-ID: <4CB58BAD.5090806@gmail.com>
Date: Wed, 13 Oct 2010 12:36:29 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.1290.1286961912.3514.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.1290.1286961912.3514.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 10:36:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2010 11:25 AM, 
openembedded-devel-request@lists.openembedded.org wrote:
> >  I'm trying to compile log4cxx, but it fails compiling apr-util, saying
> >  that it is looking at host includes.
> >
> >  I suspect the following from log.do_configure is a problem:
> >
> >  /checking for pg_config... /usr/bin/pg_config
> >     adding "-I/usr/include/postgresql" to CPPFLAGS
> >     adding "-L/usr/lib" to LDFLAGS/
> >
> >  But I have no idea how to fix it...
> >
> >  - Tasslehoff
> >  _______________________________________________
> >  Openembedded-devel mailing list
> >  Openembedded-devel@lists.openembedded.org
> >  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> This may not be related but I ran into apr-util looking at the host
> machine as well when I was trying to build subversion. I can not
> remember now the exact package I installed on the build machine that
> fixed it. So maybe trying searching for some packages that deal with
> apr-util that you dont have on your build machine. I could be way off
> for yours but seems very similar to what I had to do. Hope this helps
> some
>    
Thanks. I read about your woes before my post :)

I've installed pretty much every apr-util-package I can find on my 
Ubuntu 10.04, and did an "apt-get build-dep subversion" in desperation, 
but still the same error.

- Tasslehoff


