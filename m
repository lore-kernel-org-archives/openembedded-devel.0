Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KQeSP-0005sp-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 10:33:21 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3483489rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2008 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=oQoH1eCmN9kr4P4AnDuKMZtygfZW+xA2VcIHYRd9NrA=;
	b=ifzltu4awv6UNC3ED5fZ4ZuSsiWdJYTnjhKWhc0I8WJ5fJxze85jInJ8GhCskfn4kd
	1JkaTpan5EtvG/C2NJvii2cFAXm8P5lvjBpdpWF+GvBQgjVvLypFTK1kR/fToiIxDFvj
	5vQrYzf+6C3b0xmOI9q8HzCaMSM3gwWhEkeFs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=fhUisIxhT6MToLhv8VsPAR9g0EaJwAXzr1iSOZMYdA2qNwm1jRxlQib6JrR5RW2DqF
	J7Eb8XaTOu09pYrBY+r48Gm6m8ojh+8qDO4rmeDZsyxFvexg4KSPVzfEr6aKYijiqj2N
	T7n2pPp/sghvwL0HHmJsEgNjqeWOvvtYsScCs=
Received: by 10.141.13.16 with SMTP id q16mr8733406rvi.99.1218011596156;
	Wed, 06 Aug 2008 01:33:16 -0700 (PDT)
Received: by 10.141.156.18 with HTTP; Wed, 6 Aug 2008 01:33:16 -0700 (PDT)
Message-ID: <d1b08f940808060133l5c24d3f3w665361c418698e30@mail.gmail.com>
Date: Wed, 6 Aug 2008 10:33:16 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080805144949.9FB8D189354@amethyst.openembedded.net>
MIME-Version: 1.0
References: <bug-4393-13@http.bugs.openembedded.net/>
	<20080805144949.9FB8D189354@amethyst.openembedded.net>
Subject: Re: [Bug 4393] mysql-4.1.18-r3 fails do_compile
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
X-List-Received-Date: Wed, 06 Aug 2008 08:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

dunno how it could apply (cross-compile for solaris), but found this on Google

http://phildev.net/solaris/mysql.html

If you get an error such as: "checking return type of sprintf...
configure: error: can not run test program while cross compiling"
during configure, check to see if it seems to think c++ is a cross
compiler.....

further reads
http://gcc.gnu.org/ml/gcc-help/2002-05/msg00205.html
http://www.listsearch.com/MySQL/Thread/index.lasso?36994#246708


