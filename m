Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 09:53:41 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id D026F71A78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:53:41 +0000 (UTC)
Received: from [192.168.1.41] ([80.147.195.117]) by mail.gmx.com (mrgmx102)
	with ESMTPSA (Nemesis) id 0LyS5K-1apEFZ3nDa-015qs2;
	Tue, 11 Oct 2016 11:48:36 +0200
From: =?UTF-8?Q?Dominic_Sacr=c3=a9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
References: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
	<1475921015-7131-2-git-send-email-schnitzeltony@googlemail.com>
Message-ID: <663f41e0-6925-9d81-302b-99e90a778a20@gmx.de>
Date: Tue, 11 Oct 2016 11:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475921015-7131-2-git-send-email-schnitzeltony@googlemail.com>
X-Provags-ID: V03:K0:gG3/TH7QF6gk2OU3eI0lD4s6i/CnP5THyGMqTfPO4TIYaF+JCAr
	GAIAXilpl+kPEGTnVWr+DLmlG1e31MBNQwwmvtFaHmGRg72r4OCUrCJ8fSXmsJiXS0ngc2w
	jiZC4EkA8xATQsEJ82+IQ7Rh5Q0pwNDdjq5eDu8l3G8Kep8iFP/al/MocU7ULte+0zPH4Sl
	p5Bk397sf8aHXnerTn93Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vLlKL/SEcLA=:LH5ERTofIpDGzpCT6kF8jn
	Gt0qLpcJPIoVgmtgnswzGK4Mltm4oz/6ollm3BJHAePJD1qx6aOPxqSLjLz0DTpCsDJPt7bcM
	GUIQravQfOsk4WEmO7Lt9MFpEstbhTOMdYgKjgYYTCPq/b/oqlmshwu69kDB8g4RpfROq/cNk
	rj+HPGNkbqp/impvdElYxXwYZZAdHF7XH5IPHPjaTxI8rIUB/KgEKpsp5aeEIWh/Ahn/U+VFh
	rAlhVrntpkd46PeyamMJtqAmUjC0yYsdETnHVUzuKI16jc7nRsJ/fnC8aon/bgxcwXmFgMI5t
	Rq8TsYuqHUH+jQaVif6Z9nYOPBKwjsjMQB2HFtriX1pg+9ez7f2ddK9pEi4qsvPXZiLiiGqJQ
	GmcPOSRzsRbpXloN0YzNAUmg+BoBf6ffd1g5gI6hhP4JcKZiSCAEM/jg5Azrte19ASLwhbgio
	72jwyKyak/bViPx481hD/T8lHFyuAPUC7JkaDIQXW2e5nVDx6LzNv/LLVlQBb6pfxy3ZxVZrN
	P6Zj+0QtkDOyx+ixmeVwvemRgEtSjBi7jzVteimB7F8fLUhM8kI/4og3N3RgFfFE/Z0J+eNvb
	fxBvykenXCDX7efNlnmt9QGiQVl00bqszkOhMIlHYES5yuylbCSfxJlCNVU0JeXiD05rXLryV
	AJAiJXsGhR1ww0Ac/pMhBOlQvv7yBs+ui/dhH1rJDXvCKRqL3VMgSezu95Ez1t9CFQma5S8WP
	PH9W7BtNIwkaSOePhjmEuqdNGZKJYOodRJDA42rCrg/ge84PX14GacuB6y0tsvT8WBSeKwsP5
	Lk6+g+T
Subject: Re: [PATCH V2 1/4] jack: swap to jack2
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
X-List-Received-Date: Tue, 11 Oct 2016 09:53:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 2016-10-08 12:03, Andreas Müller wrote:
> * works out of the box without modificatins to /etc/security/limits.conf neccessary
> * neon support was introduced
> * on RaspberryPi2 buffer sizes can be set to smallest accepted value without XRUN
>   -> reduced latency

Jack1 and Jack2 are alternative implementations with different
advantages and disadvantages (depending on hardware and use-case).

Despite its name, Jack2 is not really the successor to Jack1, so I think
it would be better to keep "jack" as is, and add "jack2" as a separate
recipe.

Note that Jack2 runs in so-called asynchronous mode by default, which
adds a bit of latency (at the same buffer size), and also influences the
way xruns are reported.
Both versions will require modifications to /etc/security/limits.conf in
order to use realtime (FIFO) scheduling, which is crucial for low latencies.


Dominic

