Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PFB9G-00044H-KB
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 20:43:31 +0100
Received: (qmail 1816 invoked by uid 503); 7 Nov 2010 20:12:41 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 7 Nov 2010 20:12:41 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Nov 2010 21:42:33 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 7 Nov 2010 21:42:31 +0200
Message-ID: <4CD70127.8060404@eukrea.com>
Date: Sun, 07 Nov 2010 20:42:31 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>	<4CD2FAF0.4080905@freyther.de>	<4CD305FC.7070305@eukrea.com>	<4CD3CF1E.4040804@freyther.de>	<4CD3D16C.70901@eukrea.com>
	<4CD3DA8D.5020300@freyther.de>
In-Reply-To: <4CD3DA8D.5020300@freyther.de>
X-Ovh-Tracer-Id: 83035119153556809
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Sun, 07 Nov 2010 19:43:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 05/11/2010 11:21, Holger Freyther a écrit :
> 1.) record a trace (e.g. the qtdemo) you will need Qt/X11 for that (desktop,
> device). But make sure that the qtdemo width/height fits on the screen.
>
> $ qttdemo -graphicssystem trace (exit the app normally)
>
> 2.) Use qttracereply to replay the trace, it will print nice FPS data.
>
>
here are the results :
Distro : angstrom-2010.x
CPU : i.MX357
Kernel : Linux 2.6.36+patches

trace generated using example concentriccirles (from qt4.7 X11 32bits sdk), 
screen resolution : 320x240 :
concentriccircles  -geometry 320x240  -graphicssystem trace

bench :
mount -o remount,ro /
qttracereplay ./qtgraphics-106954754.trace -qws (run 5 times)

=> qt4.7 with armv6 arch :
# qttracereplay ./qtgraphics-106954754.trace -qws
Read paint buffer version 1 with 282 frames
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7403, 
median(ms): 7405, stddev: 0.012733 %, max(fps): 38.092665
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7375, 
median(ms): 7376, stddev: 0.011070 %, max(fps): 38.237288
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7370, 
median(ms): 7371, stddev: 0.016920 %, max(fps): 38.263229
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7388, 
median(ms): 7389, stddev: 0.011050 %, max(fps): 38.170005
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7372, 
median(ms): 7373, stddev: 0.016915 %, max(fps): 38.252849

=> qt4.7 with arm arch :
# qttracereplay ./qtgraphics-106954754.trace -qws
Read paint buffer version 1 with 282 frames
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7435, 
median(ms): 7436, stddev: 0.010980 %, max(fps): 37.928716
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7431, 
median(ms): 7434, stddev: 0.022866 %, max(fps): 37.949132
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7456, 
median(ms): 7457, stddev: 0.010949 %, max(fps): 37.821888
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7423, 
median(ms): 7424, stddev: 0.010998 %, max(fps): 37.990031
./qtgraphics-106954754.trace, iterations: 3, frames: 282, min(ms): 7417, 
median(ms): 7417, stddev: 0.050828 %, max(fps): 38.020763

Conclusion : no regression, nearly no improvement.

Eric


