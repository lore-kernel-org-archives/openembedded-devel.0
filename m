Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UHyup-00078d-U2
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 16:57:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 63C4C3140756
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 16:40:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PNngPhh5Eb6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 16:40:34 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.228.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 145C73140755
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 16:40:34 +0100 (CET)
Message-ID: <514886F0.9040601@opendreambox.org>
Date: Tue, 19 Mar 2013 16:40:32 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1363688659-2222-1-git-send-email-obi@opendreambox.org>
	<20130319124909.GA6165@windriver.com>
In-Reply-To: <20130319124909.GA6165@windriver.com>
Subject: Re: [meta-networking][PATCH] autofs: update to current patchlevel
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
X-List-Received-Date: Tue, 19 Mar 2013 15:58:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 19.03.2013 13:49, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] autofs: update to current patchlevel] On 13.03.19 (Tue 11:24) Andreas Oberritter wrote:
> 
>> * Apply all patches from ftp.kernel.org/pub/linux/daemons/autofs/v5/patches-5.0.8/
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  .../autofs-5.0.7-add-symlink-pseudo-option.patch   |  217 +++++++++
>>  ...witch_conf-to-not-contain-automount-lines.patch |   50 +++
>>  ...s-5.0.7-depricate-nosymlink-pseudo-option.patch |   40 ++
>>  ...-5.0.7-document-browse-option-in-man-page.patch |   46 ++
>>  ....0.7-dont-fail-on-master-map-self-include.patch |   59 +++
>>  ....7-dont-schedule-new-alarms-after-readmap.patch |   69 +++
>>  ...ent-d_type-to-filter-out-files-in-scandir.patch |   41 ++
>>  ...s-5.0.7-fix-automounter-support-on-parisc.patch |   24 +
>>  ...descriptor-leak-when-reloading-the-daemon.patch |  179 ++++++++
>>  ...utofs-5.0.7-fix-init-script-status-return.patch |   39 ++
>>  .../autofs-5.0.7-fix-libtirpc-build-option.patch   |   66 +++
>>  ...-fix-map-entry-duplicate-offset-detection.patch |   37 ++
>>  ...ofs-5.0.7-fix-nobind-man-page-description.patch |   46 ++
>>  .../autofs-5.0.7-fix-requires-in-spec-file.patch   |   37 ++
>>  .../autofs-5.0.7-fix-submount-offset-delete.patch  |   45 ++
>>  ...ofs-5.0.7-fix-systemd-unidir-in-spec-file.patch |   72 +++
>>  ....7-fix-use-get_proximity-without-libtirpc.patch |   54 +++
>>  ...s-5.0.7-fix-wildcard-multi-map-regression.patch |  225 ++++++++++
>>  ...e-WITH_LDAP-conditional-around-LDAP-types.patch |  448 +++++++++++++++++++
>>  ...-5.0.7-make-yellow-pages-support-optional.patch |   15 +-
>>  ...odules-replicated-use-sin6.addr-s6_addr32.patch |   39 ++
>>  .../autofs-5.0.7-update-kernel-include-files.patch |   92 ++++
>>  ...-protocol-ids-instead-of-protoent-structs.patch |  471 ++++++++++++++++++++
>>  ...karound-missing-GNU-versionsort-extension.patch |  149 +++++++
>>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |   25 +-
>>  25 files changed, 2582 insertions(+), 3 deletions(-)
> 
> I had started to ask why we wouldn't just update to 5.0.8 directly
> instead of patching our way there.  Then I thought I'd look myself and
> now I know.  :-)
> 
> This is just a simple (and wholesale) integration of the patches already
> upstream?  That seems reasonable to me.

Yes.

In the future, maybe we should switch to Git. A repository for autofs is
available at
git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git. For now, I
didn't want to change the recipe too much.

One of these patches fixed a problem, where the automount daemon would
hang after receiving SIGHUP, but I don't know which one exactly.

Regards,
Andreas


