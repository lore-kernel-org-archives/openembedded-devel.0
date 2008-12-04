Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1L8Kan-0005fe-8I
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 21:14:33 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 7B60C401F3;
	Thu,  4 Dec 2008 16:11:00 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 80A76C306;
	Thu,  4 Dec 2008 18:10:09 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id AA19F61006E; Thu,  4 Dec 2008 18:10:52 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>
	<gh6l93$480$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 04 Dec 2008 18:10:52 -0200
In-Reply-To: <gh6l93$480$1@ger.gmane.org> (Koen Kooi's message of "Wed\,
	03 Dec 2008 20\:05\:07 +0100")
Message-ID: <87bpvrog4z.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: wierd rdepends on libvolume-id-dev
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
X-List-Received-Date: Thu, 04 Dec 2008 20:14:33 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 03-12-08 19:16, Otavio Salvador wrote:
>> Hello,
>>
>> I've noticed a very weird rdepends on libvolume-id-dev. Take a look
>> bellow:
<...>
>> Do someone has any idea why it has this depends?
>
> Have a look at
> /OE/angstrom-dev/staging/i486-angstrom-linux-gnueabi/shlibs/libvolume*.list
> to see what OE thinks the -dev package provides.

otavio@neumann:~/hacking/ossystems/oe$ cat tmp/staging/i486-ossystems-linux/shlibs/libvolume-id-dev.list 
libvolume_id.so.0
otavio@neumann:~/hacking/ossystems/oe$ cat tmp/staging/i486-ossystems-linux/shlibs/libvolume-id.list 
libvolume_id.so.0

Any idea how to fix it?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


