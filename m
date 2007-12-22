Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J667T-0007C3-Kw
	for openembedded-devel@openembedded.org; Sat, 22 Dec 2007 16:18:31 +0100
Received: from Powerbook-2.local (vpn006104.vpn.utwente.nl [130.89.6.104])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBMFD60k029015 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2007 16:13:06 +0100
Message-ID: <476D2982.7080304@student.utwente.nl>
Date: Sat, 22 Dec 2007 16:13:06 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1187652493.20071219133208@gmail.com>	<47690C8A.8090001@student.utwente.nl>
	<1177027983.20071222144538@gmail.com>
In-Reply-To: <1177027983.20071222144538@gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] BogoFeeds reloaded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Dec 2007 15:18:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Wednesday, December 19, 2007, 2:20:26 PM, you wrote:
> 
> []
> 
>>> +
>>> +       if [ -n "${FEED_LOCAL_BASE_URI}" ]; then
>>> +           for arch in ${PACKAGE_ARCHS}
>>> +           do
>>> +               echo "src/gz local-$arch ${LOCAL_FEED_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/ipkg/local-$arch-feed.conf
>>> +           done
>>> +       fi
>>>  }
>>>  
>>> So, you set FEED_LOCAL_BASE_URI to the root of deploy dir as exported
>>> by Apache, and - voila - you get nice collection of per-arch local feeds in
>>> the image.
> 
>> Could you add a comment in image.bbclass and local.conf.sample on how to
>> use this, since it looks quite the same as FEED_URI to a new user, but
>> is quite different? And while you are at it, update the OE usermanual as
>> well?
> 
>   Ok, to make it more precise, I've renamed it to
> FEED_DEPLOYDIR_BASE_URI. Added comments here and there.
> 
>   Edited also the manual, it lacked and FEED_* description at all, so
> I've added section on it. I also rearranged chapters in manual so it
> was more natural to learning reader: Intro - Getting Started -
> everything else. Now, questions about manual availability. Is
> http://www.openembedded.org/user-manual updated anyhow?

It's being updated hourly for the org.openembedded.documentation branch
on monotone.openembedded.org

> It lacks
> changes I made ~week ago to describe ASSUME_SHLIBS. 

Those changes aren't in the db on monotone.openembedded.org, did you do
'mtn sync monotone.openembedded.org org.openembedded.{dev,documentation}' ?

> There's no
> mentioning of PDF manual on OE site, instead, there's news somewhere
> deep on Angstrom site. And http://www.openembedded.org/%7Ekoen/usermanual.pdf
> it links to dated 2007-10-09.

'make pdf' was having some troubles, so it is html only for the time
being. The angstrom folks provide a pdf version out of courtesy.



>> regards,
> 
>> Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHbSmBMkyGM64RGpERArVlAKCl7W1FbXIAcPqS9oqPRkymERoj8wCbBzI0
SzOYn81Te9KjtCOZ8WKivso=
=17yP
-----END PGP SIGNATURE-----


