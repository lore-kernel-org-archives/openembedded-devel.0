Received: from rrcs-24-227-36-211.se.biz.rr.com ([24.227.36.211]
	helo=mail.eoimaging.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nharris@eoimaging.com>) id 1PuA2I-0000qn-Fy
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 21:49:42 +0100
Received: from [192.168.0.194] ([::ffff:192.168.0.194]) (AUTH: LOGIN nharris)
	by mail.eoimaging.com with esmtp; Mon, 28 Feb 2011 15:48:18 -0500
	id 0020864B.4D6C0A12.00004D45
Message-ID: <4D6C0A15.1040406@eoimaging.com>
Date: Mon, 28 Feb 2011 15:48:21 -0500
From: Nathan Harris <nharris@eoimaging.com>
Organization: Electro-Optical Imaging, Inc.
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D6BAE92.1080409@eoimaging.com> <4D6BEEDA.3000203@mentor.com>
In-Reply-To: <4D6BEEDA.3000203@mentor.com>
Subject: Re: QA issues with libvmime
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
X-List-Received-Date: Mon, 28 Feb 2011 20:49:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/2011 1:52 PM, Tom Rini wrote:
> On 02/28/2011 07:17 AM, Nathan Harris wrote:
>> I am working on a recipe for the VMime library (http://www.vmime.org/).
>> My target environment is the Overo (Gumstix). Currently, bitbake is
>> failing during the final QA. My recipe, patch and bitbake output are
>> below. Hopefully, this error is familiar to someone. Thanks!
> [snip]
>> inherit scons
> [snip]
>> ERROR: QA Issue with staging: vmime.pc failed sanity test (tmpdir) in
>> path
>> /home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig 
>>
>
> So, what this means it that vmime.pc wasn't properly cleaned.  If you 
> add pkgconfig to the inherit list (which brings in 
> classes/pkgconfig.bbclass, take a peek at what it's doing) this will 
> go away.
>
> Arguably we should make the error clearer and say, like the gettext 
> one something about missing inherit pkgconfig in the recipe.
>
Thanks for the help.  Looking at the vmime.pc file, I can see that the 
paths are wrong.

Unfortunately, when I added pkgconfg to my inherit list, cleaned the 
package and then re-bitbaked, I still get the same error message.  I 
verified that vmime.pc is removed during the clean process (along with 
the other temp files).

I changed the inherit line of my recipe to read:
inherit scons pkgconfig

Here's what my vmime.pc file looks like after bitbake:

prefix=/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/image/usr
exec_prefix=/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/image/usr
libdir=/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/image/usr/lib
includedir=/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/image/usr/include

Name: VMime Library
Description: VMime C++ Mail Library (http://www.vmime.org)
Version: 0.9.1
Requires: libgsasl
Libs: -L${libdir} -lvmime -lgsasl
Cflags: -I${includedir}/




