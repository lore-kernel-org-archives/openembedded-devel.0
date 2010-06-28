Received: from ey-out-1920.google.com ([74.125.78.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OTIBz-0003Gw-Ev
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 19:32:27 +0200
Received: by ey-out-1920.google.com with SMTP id 5so135351eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=D4ZIjWaROqavoDMB2QDFTYo0uq0wP/lGEw8fQ9KExbE=;
	b=ZIscBjK62y18oW+6YjWPC5T6S8XdcTHMN8q0T+YZGtoEO6AOUGcmbrkZ3RQNJS/qAk
	KzimLlnKRz2R3pqvVrLK8e/zQfBPeieRlXdYjMQuY0DgzsRJYNh1oFyUxwV2abKnuE19
	LC0xLOVv760La3NsN0p3RYQYuqC4bSE+65FqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=OCqb6d8/lHJR8vkf4VEaNFJhLAwidmFb3j2MBbPjQZOovXhfEGTH4DZgKBy+jkVBlI
	j3vA3fMrEuyXP/oREo4QWLwTWQTCtOsoBVRIpFEPsK0Sy1XtnOoWMAXqpqsKFsJCyPKC
	qGjgaU4GhdzXOXIc6B4JNBBp22yNAUTo7ud/U=
Received: by 10.213.27.206 with SMTP id j14mr1718267ebc.3.1277746063312; Mon, 
	28 Jun 2010 10:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Mon, 28 Jun 2010 10:27:22 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFC9@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFC9@KCINPUNHJCMS01.kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jun 2010 10:27:22 -0700
Message-ID: <AANLkTinERWGrEJh6Jo-nAgUjzzlQkWhMgRIrzzMl3G8D@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cc1plus: error: unrecognized command line option "-mmmx"
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
X-List-Received-Date: Mon, 28 Jun 2010 17:32:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 28, 2010 at 4:20 AM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> compiling libtiff.cpp
> libtiff.cpp:42:20: error: tiffio.h: No such file or directory
> libtiff.cpp:50:6: error: #error "Required libtiff not found"
> libtiff.cpp: In function 'int main(int, char**)':
> libtiff.cpp:57: error: 'tdata_t' was not declared in this scope
> libtiff.cpp:57: error: expected `;' before 'buffer'
> libtiff.cpp:58: error: 'buffer' was not declared in this scope
> libtiff.cpp:58: error: '_TIFFfree' was not declared in this scope
> libtiff.cpp:62: error: 'TIFFReadRGBAImageOriented' was not declared in this scope
> make: *** [libtiff.o] Error 1

seems you are missing a dependency on libtiff or somesuch in whatever
recipe you are
building here. there is similar problem few line below in the log
>


