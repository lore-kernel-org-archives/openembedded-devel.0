Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pva1g-0004gB-JL
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 19:46:56 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pva0F-0003Qe-HS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 10:45:27 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 4 Mar 2011 10:45:27 -0800
Received: from [172.30.80.235] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 4 Mar 2011 10:45:26 -0800
Message-ID: <4D713344.5000407@mentor.com>
Date: Fri, 4 Mar 2011 11:45:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D705C07.20508@freescale.com>	<1299244359-5345-1-git-send-email-obi@opendreambox.org>	<4D7107F9.90008@gmail.com>
	<1299255257.3830.37.camel@mattotaupa>
In-Reply-To: <1299255257.3830.37.camel@mattotaupa>
X-OriginalArrivalTime: 04 Mar 2011 18:45:27.0361 (UTC)
	FILETIME=[5442D310:01CBDA9C]
Subject: Re: [PATCH] mrouted-3.9.4: intitial recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 18:46:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2011 09:14 AM, Paul Menzel wrote:
> Am Freitag, den 04.03.2011, 07:40 -0800 schrieb Khem Raj:
>> On 3/4/2011 5:12 AM, Andreas Oberritter wrote:
>>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>>> ---
>>> This was only compile-tested. It would be nice to get some feedback.
>>
>> Looks ok to me. Does it need any deps? May be building it from scratch
>> will detect it if not otherwise
>>
>> Acked-by: Khem Raj<raj.khem@gmail.com>
>
> With the dependencies addressed and …
>
>>>    recipes/mrouted/mrouted_3.9.4.bb |   23 +++++++++++++++++++++++
>>>    1 files changed, 23 insertions(+), 0 deletions(-)
>>>    create mode 100644 recipes/mrouted/mrouted_3.9.4.bb
>>>
>>> diff --git a/recipes/mrouted/mrouted_3.9.4.bb b/recipes/mrouted/mrouted_3.9.4.bb
>>> new file mode 100644
>>> index 0000000..4ba4111
>>> --- /dev/null
>>> +++ b/recipes/mrouted/mrouted_3.9.4.bb
>>> @@ -0,0 +1,23 @@
>>> +DESCRIPTION = "DVMRP multicast routing daemon"
>>> +HOMEPAGE = "http://troglobit.com/mrouted.shtml"
>>> +SECTION = "network"
>>> +LICENSE = "BSD"
>>> +
>>> +SRC_URI = "ftp://ftp.vmlinux.org/pub/People/jocke/mrouted/mrouted-${PV}.tar.bz2"
>>> +SRC_URI[md5sum] = "688b74fc42919d588f262e6b3c9c6d4c"
>>> +SRC_URI[sha256sum] = "c697549b2e506a380575f7adb67e87288ef2295b97241b3a1aeb0e88b827a3e1"
>>> +
>>> +EXTRA_OEMAKE = " \
>>> +        datadir=${datadir} \
>>> +        mandir=${mandir} \
>>> +        prefix=${prefix} \
>>> +        sysconfdir=${sysconfdir} \
>>> +        DESTDIR=${D} \
>>> +"
>>> +
>>> +do_compile() {
>>> +        oe_runmake
>>> +}
>
> … add a blank line (?) this is
>
> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>

Well, we don't need a do_compile since that's just a smaller copy of 
base_do_compile :)

>
>>> +do_install() {
>>> +        oe_runmake install
>>> +}
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Tom Rini
Mentor Graphics Corporation


