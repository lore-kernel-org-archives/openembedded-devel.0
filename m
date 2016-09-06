Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id ED49A6FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 07:55:45 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bhBEM-000807-CL for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2016 09:55:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 6 Sep 2016 09:55:35 +0200
Message-ID: <nqlspm$qbt$1@blaine.gmane.org>
References: <CALbNGRS8C7Cq0sND-gZNM9yFTcMsLW5n8dPhjqcvBatVwJXFKA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
In-Reply-To: <CALbNGRS8C7Cq0sND-gZNM9yFTcMsLW5n8dPhjqcvBatVwJXFKA@mail.gmail.com>
Subject: Re: fftw recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 07:55:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 06-09-16 om 09:02 schreef Andreas Müller:
> Hi,
> 
> is there a technical reason why we have multiple fftw recipes (fftw /
> fftwl / fftwf)?

Yes, at the time of writing there was no easy way to generate the different
libraries using one recipe. Worse, the headers conflict, even in the current
situation :/

regards,

Koen


> 
> or
> 
> before I start: Any complaints/comments if I
> 
> * merge all fftw's into one recipe named fftw splitting in multiple
> packages (fftw / fftwl / fftwf / fftwq?)
> * replace virtual/fftw by fftw
> * make oe-core's alsa-utils fftw PACKAGFCONFIG[fftw] depending in fftw
> 
> Feedback welcome
> 
> Andreas
> 



