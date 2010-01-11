Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NURxK-0002rx-Da
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:37:49 +0100
Received: by fxm4 with SMTP id 4so18438966fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 13:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Ty4qxVycOcmZ4nV9bl4AC69X4Y+ri0vhm69ibl7FpGE=;
	b=JG+N9ZLJ6gWSZj0P0trX3YUPk/tr7ptUhZM78dyLHWrciTgsj9cfhSc0wpH09DMpNT
	fDIb4dWvwY+xcpzhDDGi2O6TvYrN+S3yWsZl2tfOBXN9akKWAVkQb1evtX5foSN9G9ju
	EvJQ4t9kbtvf0Y2tUF3wPyYARaviSCHqtZ2Qo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wp89OSWgWNIsLV6YEePiVTr0Yp4f+HLAPQNrqluSzg/mNA9CTOYEjhxjeAzhzVmaFP
	UclPmk51wHXZUXJXr3cvTTyXOAmbrXWGBGa9GjiK2t3zY5bkxz9S6A9FUxDebM11dTP7
	PwwiC/ZB8/OmjrFLRJGDwyk6Z7F190E7MTmq8=
Received: by 10.223.4.86 with SMTP id 22mr5359166faq.65.1263245737550;
	Mon, 11 Jan 2010 13:35:37 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm9872194fxm.0.2010.01.11.13.35.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Jan 2010 13:35:36 -0800 (PST)
Date: Mon, 11 Jan 2010 22:35:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100111213530.GU17224@jama>
References: <loom.20100109T213305-664@post.gmane.org>
	<20100109221158.GA1444@rhein.zuhause.netz>
	<loom.20100111T101557-577@post.gmane.org>
	<20100111094046.GQ17224@jama>
	<loom.20100111T211613-99@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20100111T211613-99@post.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building classpath / ecj-initial fails
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
X-List-Received-Date: Mon, 11 Jan 2010 21:37:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2010 at 08:57:13PM +0000, Chris Veigl wrote:
> Martin Jansa <martin.jansa <at> gmail.com> writes:
> > > ERROR: function do_compile failed
> > > 
> 
> > git pull.. se my commit yesterday
> 
> 
> I did a git pull, cleared the tmp folder and let 
> bitbake run during the night, but get the same error:
> 
>   tmp/staging/i686-linux/usr/bin/java-initial -classpath  antlr.Tool -o \
>     ../tools/generated/gnu/classpath/tools/gjdoc/expr/ \
>     ./gnu/classpath/tools/gjdoc/expr/java-expression.g
>   Unrecognised command line option: -o

Strange because this should be built only with gjdoc enabled, which I
disabled, because I had exactly the same problem (it worked only on
system with antlr installed also outside OE staging).

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=762fa9e86556d8f12031eaa383063d379fde21d7

I did it only for classpath-native, maybe you need similar workaround
for classpath (if you don't need to build gjdoc).

# SHR distro.. We had only this P_Vs now..:

# We need this for jamvm
PREFERRED_VERSION_classpath = "0.98"
PREFERRED_VERSION_classpath-native = "0.98"

And all PREFERRED_PROVIDERs set by compatibility-providers.conf

Regards,

> 
> 
> must be something different ...
> seems like jamvm version 1.4.5 does not have the "-o" switch !?
> 
> I currently use
> 
>   PREFERRED_VERSION_jamvm-initial = "1.4.5"
>   PREFERRED_VERSION_classpath-initial = "0.93"
> 
>   PREFERRED_VERSION_jamvm-native = "1.5.3"
>   PREFERRED_VERSION_classpath-native = "0.98"
> 
>   PREFERRED_VERSION_jamvm = "1.5.2"
>   PREFERRED_VERSION_classpath = "0.98"
> 
>   PREFERRED_VERSION_libecj-bootstrap = "3.4"
> 
> as recommended in the openembedded wiki ...
> regards,
> chris.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


