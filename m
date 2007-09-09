Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IUPWV-0005dM-GU
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 18:20:35 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l89GHdxP025680 for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Sep 2007 18:17:39 +0200
Message-ID: <46E41C9C.1020509@student.utwente.nl>
Date: Sun, 09 Sep 2007 18:17:32 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46CF6903.7060703@dominion.kabel.utwente.nl>	<20070905225908.dcyz0rbxa8wo4ows@www.bufferoverflow.ch>	<46DFA451.6020006@student.utwente.nl>	<46E24E51.3080700@student.utwente.nl>	<46E4027F.107@student.utwente.nl>
	<20070909175714.cvxg6cq9icoocggo@www.bufferoverflow.ch>
In-Reply-To: <20070909175714.cvxg6cq9icoocggo@www.bufferoverflow.ch>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: ss
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: OE website upgraded to drupal 5.2
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
X-List-Received-Date: Sun, 09 Sep 2007 16:20:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Roger Meier schreef:
> Quoting Koen Kooi <k.kooi@student.utwente.nl>:
> 
> Koen Kooi schreef:
>>>> Koen Kooi schreef:
>>>>> Roger Meier schreef:
>>>>>> Hi Koen
>>>>>> Which drupal and module versions did you use before upgrade?
>>>>>> There are still some issues with the wiki headings.
>>>>>> e.g. on page http://www.openembedded.org/wiki/GettingStarted
>>>>> That is manually inserted html, so probably the content-type for   
>>>>> wiki needs to get
>>>>> cascaded or we have to patch the markup filter.
>>>> The correct answer was: "we have to patch the markup sanitizer",   
>>>> which I did :) The wiki
>>>> works as expected now, the only issue left is the reversed news.
> The reversed news issue turned out to be a case of one   
> 'db_rewrite_sql()' too many, this
> is fixed now.
>> Great!
> 
> The current TODO:
>> just drop a line if you need a hand on one of these topics!

*drops line* :)

> 
> * unify tinderbox, viewmtn, org.oe.documentation and main website css
>> It would be great to have viewmtn integrated into apache webserver.
> 
>> The URL http://www.openembedded.org:1081/ would not be accessible on  
>> every network(e.g. corporate networks)
> 
>> The following manual describes the way to do this:  
>> http://viewmtn.angrygoats.net/revision/file/6971b1ddbf5c30977d1c306f3baa120d709d474e/INSTALL

That sadly doesn't work since it does somewhere in the fastcgi process. I haven't been
able to figure out was is going wrong :( The interim solution was to use the web.py
approach which is running now.

> * make everything conform to standards (xhtml?)
>> Most drupal sites conform to xhtml.
>> There are just a few Error's left:  
>> http://validator.w3.org/check?verbose=1&uri=http%3A%2F%2Fwww.openembedded.org%2F

I don't know anything about html other than <center> and <br> ;)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG5BycMkyGM64RGpERAgboAKCwsUpiHqxZ6cicGWjlQkfOsWu3TgCfWFS4
QHX3F2eluir845MJmcURYx8=
=0MkB
-----END PGP SIGNATURE-----


