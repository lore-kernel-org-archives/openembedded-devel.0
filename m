Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LY2wL-0004PA-0j
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 19:39:05 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id EF8724020B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 14:37:52 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 33FF1740C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 16:37:10 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 4A64E610067; Fri, 13 Feb 2009 16:37:29 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131728.08634.openembedded@haerwu.biz>
	<878woae03q.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Feb 2009 16:37:29 -0200
In-Reply-To: <fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
	(Ihar Hrachyshka's message of "Fri, 13 Feb 2009 19:39:39 +0200")
Message-ID: <871vu2chee.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Subject: Re: checksums situation
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
X-List-Received-Date: Fri, 13 Feb 2009 18:39:05 -0000
Content-Type: text/plain; charset=us-ascii

Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:

> On Fri, Feb 13, 2009 at 7:08 PM, Otavio Salvador <otavio@debian.org> wrote:
>> Marcin Juszkiewicz <openembedded@haerwu.biz> writes:
>>
>> <...>
>>> This solution also has one nasty part - now we can keep SRC_URI for
>>> multiple versions in common file, but if we switch to storing it in
>>> SRC_URI we will have to change that.
>>>
>>> Other solution proposed on IRC was to keep checksums in extra file in
>>> each directory of packages/ subdirectory. I think that it is not best
>>> but sounds better then one file.
>>>
>>> What do you think? Which way we should go? Do you have other ideas?
>> <...>
>>
>> What about having a checksums for _each_ recipe?
>>
>> foo_1.0.bb
>> foo_1.0.md5sum
>
> This will waste directories and will make tree navigation harder.

Well; so let's just create a md5sums directory at OE topdir and add the
dirs and files there.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


