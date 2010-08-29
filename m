Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ope0S-0001vM-RC
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:16:54 +0200
Received: by iwn2 with SMTP id 2so3872380iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 02:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=+1IDf+vVbHbcD+zzpXV4T5LHknisSd04cvSirhry+TE=;
	b=wkfU8NdAsYXoDo3AtJ8YYuyNzpaRRLsRCTknn6MXQPuNo0nsVz9xs1DwhOUa6phONd
	f8DxZt4OxVwZYQkt+5j/tX6//liFmQw7rT+wr2UAQVjhlD/5KODb3GjZQpUTzY2I7G8P
	Gl8HOVqAhUlVI4GtEiFnxDMXyRJz+jHTi46XU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=pe3EHEKKg2p8bxdAcyPupRTY/es+aaQDzBIUG5IoWfQ4gmZO+GnkPTaHc2zZTOQbR0
	AUSBSF1Y2c/6XH2M1eNvRe4eZPigap5nXBzzYaerZsPZYqw53YiH9UZR+MKNxL7uOsuB
	65RiCgeX79S3E4hPjxGvUI+b1EldBPXDbivfA=
Received: by 10.231.37.75 with SMTP id w11mr3598414ibd.45.1283073383087; Sun,
	29 Aug 2010 02:16:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 02:16:03 -0700 (PDT)
In-Reply-To: <AANLkTi=7Ys9reqVWjN5Byrpt+kagk6EBO-9xLr9ptPFa@mail.gmail.com>
References: <AANLkTi=7Ys9reqVWjN5Byrpt+kagk6EBO-9xLr9ptPFa@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 02:16:03 -0700
Message-ID: <AANLkTikkqKU+_z56TRPJKruaK9H4gKyH3wH4F1Y05fVi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4 does not build
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
X-List-Received-Date: Sun, 29 Aug 2010 09:16:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 28, 2010 at 8:11 PM, J. L. <vwyodapink@gmail.com> wrote:
> I am running ubuntu 9.10 with and up to date overo branch of OE and
> apr- util will not build gives the following error:

I cant reproduce it on ubuntu 10.04. If possible can you retry to
reproduce it on some
other build OS than 9.10

>
> NOTE: Running task 819 of 832 (ID: 9,
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
> do_qa_configure)
> ERROR: This autoconf log indicates errors, it looked at host includes.
> Rerun configure task after fixing this. The path was
> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
> ERROR: Error in executing:
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Build of
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
> do_qa_configure failed
> ERROR: Task 9 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
> do_qa_configure) failed
> NOTE: Tasks Summary: Attempted 818 tasks of which 818 didn't need to
> be rerun and 1 failed.
> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb'
> failed
>
>
> I have tried cleaning the recipe and rebuilding with no luck as well
> as trying to build from a fresh tmp directory. Though I think I
> understand the error I do not know how to go about fixing it with a
> proper patch. I would appreciate any help with this.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


