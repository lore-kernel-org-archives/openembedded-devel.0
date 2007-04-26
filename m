Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1HhCOg-0005OU-FW
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 00:25:06 +0200
Received: by nz-out-0506.google.com with SMTP id m22so857698nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 15:16:14 -0700 (PDT)
Received: by 10.114.160.1 with SMTP id i1mr776378wae.1177625774146;
	Thu, 26 Apr 2007 15:16:14 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Thu, 26 Apr 2007 15:16:14 -0700 (PDT)
Message-ID: <432beae0704261516y62dda543o62676432ac1bee76@mail.gmail.com>
Date: Thu, 26 Apr 2007 15:16:14 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1177625217.4992.1.camel@cimmeria.hyboria>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
	<4630E310.5000008@dominion.kabel.utwente.nl>
	<432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
	<1177625217.4992.1.camel@cimmeria.hyboria>
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 22:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/26/07, Graeme Gregory <dp@xora.org.uk> wrote:
>
> > A "huge gaping security hole" that requires you to download a
> > malicious ipk with malicious libraries which figures out what your
> > build path was, then installs those libraries there.
> >
> > Or you could just download a malicious ipk which overwrites the actual
> > libraries.
> >
> > I don't see what's hude or gaping about this.
> >
> Maybe you should rethink that before getting all sarcastic.
>
> /home/XXX/ hmmm, thats publically writable to users.
>

I was under the impression that /home was normally writable only by
root and the subdirs were normally only writable by the user who owns
the directory (yes, I know you can set them differently if you want).
I know I wouldn't want joe-the-user creating directory /home/justinpa
to try to confuse justinp whose home dir is /home/justinp.

> And why do malicious libraries need to come in ipk files.
>

I suppose they don't. I admit I was thinking in "Embedded" mode, which
normally means single-user to me. Still, it would have to be someone
putting files in a very specific place which should normally be only
writable by a super-user. Of course someone could use security holes
in another program to write the files, etc etc.

I'm not saying this doesn't need to be fixed, just that it seemed like
a big inconvenience for those using OE who couldn't fix the problem.
Then again it seems that someone came up with a hack at least, so....

-- 
Justin Patrin


