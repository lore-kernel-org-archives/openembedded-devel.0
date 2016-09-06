Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 1044 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Sep 2016 10:06:49 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFDF6010D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:06:49 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <CALbNGRS8C7Cq0sND-gZNM9yFTcMsLW5n8dPhjqcvBatVwJXFKA@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <15fedac3-2dad-d3d2-98da-997ec87f436d@embed.me.uk>
Date: Tue, 6 Sep 2016 10:49:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 06 Sep 2016 10:06:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/16 08:02, Andreas Müller wrote:
> Hi,
>
> is there a technical reason why we have multiple fftw recipes (fftw /
> fftwl / fftwf)?
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

I was looking at doing this myself. The library now has options to 
generate all three libs from a single source. However, the only way I 
could think to work with the header files was to have a fftw-headers 
which fftw/l/f all depended on so we don't get conflicting files in 
packaging.

Thanks for the heads up and I have no complaints as it saves me a job :)

Cheers,
Jack.

