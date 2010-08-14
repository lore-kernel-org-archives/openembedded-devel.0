Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OkOgO-00005A-8t
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 23:54:29 +0200
Received: by fxm6 with SMTP id 6so2499517fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=lbKLD2+j9Xzm6cxZ0nYMkUJ8uGCZq02rKU+ZLEmYRtg=;
	b=ngJ3hfowo8pZtaamY7tUiXsWYD1Ycq27d9gGtH0cTgFBVzeF4qY3yX9NtS4Yd5wHKi
	U2wnl6jGzYwrYj4OvivU06qyu+P4Q9EUbm9rUaYQ0IJQGcbdJQwAfEhoVkGwmbcpvSmE
	7jxaKjokwmjdUHOdtGo2CtBhwM7ULpj9+QJk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=usRMV2M37MlHJavt3Op8jpM8HHSK/2YJ8QD7FtWUhqgp60lBCVASCkcw7FCJalqGvt
	i6LjO0tbF25h2MxDjV10Tv1siH8qEJvPIWiiKhU46t3IeSyYaShhz8oyq8V98uQj20zh
	UcyoLmbGxlioJmYwlZYIiLLFZqQGsGAXfE0jA=
Received: by 10.223.113.5 with SMTP id y5mr3554513fap.93.1281822847163; Sat,
	14 Aug 2010 14:54:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 14 Aug 2010 14:53:47 -0700 (PDT)
In-Reply-To: <AANLkTime6OXahfsppUL5gVvbSVmovWcYSv2OSTceYSBq@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
	<AANLkTime6OXahfsppUL5gVvbSVmovWcYSv2OSTceYSBq@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 14 Aug 2010 15:53:47 -0600
Message-ID: <AANLkTim7NhKpm57xdraj57fhudBfv_5PkNJxry=D7UDi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 21:54:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

How do I enable logging to tenderbox? I'd be happy to do that.
I googled it to little avail:
http://www.google.com/search?hl=en&q=tinderbox+openembedded


For reference, here's the process I've been following:


rm ~/overo-oe -rf                 # *clean it all out*

mkdir -p ~/overo-oe
cd ~/overo-oe

git clone git://gitorious.org/gumstix-oe/mainline.git org.openembedded.dev
      # *get a fresh copy of the repo*

cd org.openembedded.dev
git checkout --track -b overo origin/overo
cd ~/overo-oe
git clone git://git.openembedded.net/bitbake bitbake
cd bitbake
git checkout 1.8.18
cd ~/overo-oe
cp -r org.openembedded.dev/contrib/gumstix/build .
cp ~/.bashrc ~/bashrc.bak
cat ~/overo-oe/build/profile >> ~/.bashrc
source ~/overo-oe/build/profile

bitbake omap3-console-image                       # *make the basic image
from a fresh start*


AJ ONeal

On Sat, Aug 14, 2010 at 1:04 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>
> >
> > If you are using dev head, you're living on the edge. If you can't
> > stand that better use the stable branch.
> >
> > As far as there are issues:
> > Either report them, or better fix them.
> > (or as a workaround you could find the commit wthat broke it and
> > report that and perhaps temporariy locally revert that commit if you
> > cannot fix it).
> >
> > Having said that:
> > I don't really see many issues. Maybe I'm building a different set of
> > packages or for a different set of hw or for a different distro.
> >
> > Frans
> >
> Addition: I noticed when pressing send that you also mailed to
> gumstix-users, so apparently you do have a gumstix.
> I haven't so I have never build for it and cannot really help you with
> it as I am not planning on buying one (so even though I could build I
> cannot test).
>
> What you also can do is enable logging to tinderbox then at least the
> info of the faulty builds becomes available for others.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

