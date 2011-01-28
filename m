Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PitKJ-0007Hq-Nm
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 19:45:43 +0100
Received: (qmail 5680 invoked by uid 503); 28 Jan 2011 18:42:08 -0000
Received: from b9.ovh.net (HELO mail419.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 28 Jan 2011 18:42:08 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Jan 2011 20:44:53 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 28 Jan 2011 20:44:53 +0200
Message-ID: <4D430EA4.7000504@eukrea.com>
Date: Fri, 28 Jan 2011 19:44:52 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296220547-14948-1-git-send-email-sujak.marek@gmail.com>
In-Reply-To: <1296220547-14948-1-git-send-email-sujak.marek@gmail.com>
X-Ovh-Tracer-Id: 1055249689239399753
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v2] barebox: patches for barebox 2010.10 to support vmx25
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
X-List-Received-Date: Fri, 28 Jan 2011 18:45:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marek,

On 28/01/2011 14:15, sujak.marek wrote:
> * Added default config file
> * Added patch file
> ** custom init for ram chips
> ** added vmx25 MACH IDs
> ** custom init scripts
>
> Signed-off-by: sujak.marek<sujak.marek@gmail.com>

I think you should merge this patch with the one adding the barebox 2010.10 
recipe. Or add a plain barebox 2010.10 recipe and then add

+DEFAULT_PREFERENCE_vmx25 = "1"
and
+SRC_URI_append_vmx25 = "\
+	file://barebox_2010.10-vmx25-20110112.patch; \
+	"

with the corresponding patch.

Eric


