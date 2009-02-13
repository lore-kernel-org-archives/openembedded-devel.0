Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LY3qJ-00036P-TS
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 20:36:55 +0100
Received: by fxm10 with SMTP id 10so2647806fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JS5lM9aKmCfHEzprIgRv8ACmAxZF+bH+zpcHpuD3tuE=;
	b=twO25DxZfk7HOPRFcs98O0Hgt5QiPRIBb+Z1G3/yoTHk22vJN910oDPqxSsgiOUxlS
	emsZZdFOp6/IKpPdW/XcMVIFKlZNxpsyHKdb1eiTDwFziAD8gBsmV+3pyS609I9HC9gS
	ux62GE9kKhG+5n9zLied8jaaMUQrWomXBIkXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q7CfBXL5i/OoMj8EPpz77pBbGQ3Km2iCnSxqJXODPpTZw6AZ6R2rsyQBlt3mNEIZjH
	GAR9CqMy8XX3EWFLzMj4QOENOa+8VN6+QDcKMtMLbUEuI08sHCoZniOfGuan0KvZb2Qu
	ZIWicE0PDyHoGEotzCIv9kSTMkTmlbo8ldstQ=
MIME-Version: 1.0
Received: by 10.181.61.7 with SMTP id o7mr828780bkk.51.1234553724875; Fri, 13 
	Feb 2009 11:35:24 -0800 (PST)
In-Reply-To: <871vu2chee.fsf@neumann.lab.ossystems.com.br>
References: <200902131728.08634.openembedded@haerwu.biz>
	<878woae03q.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
	<871vu2chee.fsf@neumann.lab.ossystems.com.br>
Date: Fri, 13 Feb 2009 20:35:24 +0100
Message-ID: <c384c5ea0902131135v5797291t2955907944e27bb7@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 13 Feb 2009 19:36:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Fri, Feb 13, 2009 at 7:37 PM, Otavio Salvador <otavio@debian.org> wrote:
> Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:
>
>> On Fri, Feb 13, 2009 at 7:08 PM, Otavio Salvador <otavio@debian.org> wrote:
>>> Marcin Juszkiewicz <openembedded@haerwu.biz> writes:
>>>
>>>>
>>>> What do you think? Which way we should go? Do you have other ideas?
>>> <...>
>>>

I have thought about this (and our current fetch and checksum) a lot
in the past.

>> Keep the checksums.ini file, but change it's layout a bit.

In all cases, we need to REMOVE the URL of a package from the key, as
we are ONLY interested in its contents.

So, solution 1:

>> Make the key of a package: <filename>.

However, I would opt for solution 2:

>> Make the key of a source package: <filename, sha1sum, md5sum>.

Yes, that's right. The key of a package is it's filename plus it's contents.
Filename because we humans identify it by its name.
The dual checksum because we can guarantee the desired contents.

Next step, is we adapt the fetcher to:

- find URLs for a package given any of it's (sub)key.
- check the package against its dual sums.

I have written a working proof-of-concept of a
package-fetcher/checker/ url-cache/... in C using sqlite (instead of
checksums.ini)

which is public here:

http://www.sidebranch.com/leon/witpa_20080730.tar.bz2

It can import checksums.ini though.


To summarize: remove URL from the package key.

The .bb names the upstream URL and filename.

The filename ALONE is used as the key into the file database.
The file database caches URLs for the package, and has its md5sum and sha1sum.

The fetcher tries to fetch from the cached URLs or can fall back to
Google for the file by either filename or any checksum.
It can verify correctness against the checksums.


Regards,
-- 
Leon


