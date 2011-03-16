Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PzoIn-0002Vo-TO for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:50:05 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PzoH8-00063e-QR for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:48:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:48:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:48:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 16 Mar 2011 11:48:07 +0100
Message-ID: <ilq4h7$35k$1@dough.gmane.org>
References: <1299882034-23172-1-git-send-email-eric@eukrea.com>	<ileapd$gdk$1@dough.gmane.org>
	<4D7CD7C8.1080108@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D7CD7C8.1080108@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] nodejs: update to 0.4.2
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
X-List-Received-Date: Wed, 16 Mar 2011 10:50:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-03-11 15:42, Eric Bénard wrote:
> Hi Koen,
> 
> On 12/03/2011 00:21, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 11-03-11 23:20, Eric Bénard wrote:
>>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>>
>> Does this one actually build? 0.4.0 doesn't :(
>>
> strange I had 0.4.0 running on an armv5 using angstrom-2010, about 2
> weeks ago. I just tested it again and 0.4.2 builds for the same target.

I get this:

+ do_compile
+ make
Waf: Entering directory
`/OE/angstrom-2008/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build'
[74/74] cxx_link: build/default/src/node_main_4.o
build/default/src/node_4.o build/default/src/node_buffer_4.o
build/default/src/node_javascript_4.o
build/default/src/node_extensions_4.o
build/default/src/node_http_parser_4.o build/default/src/node_net_4.o
build/default/src/node_io_watcher_4.o
build/default/src/node_constants_4.o build/default/src/node_cares_4.o
build/default/src/node_events_4.o build/default/src/node_file_4.o
build/default/src/node_signal_watcher_4.o
build/default/src/node_stat_watcher_4.o build/default/src/node_timer_4.o
build/default/src/node_script_4.o build/default/src/node_os_4.o
build/default/src/node_dtrace_4.o build/default/src/node_stdio_4.o
build/default/src/node_child_process_4.o
build/default/src/platform_linux_4.o build/default/src/node_crypto_4.o
build/default/deps/libeio/eio_1.o
build/default/deps/http_parser/http_parser_2.o
build/default/deps/libev/ev_1.o
build/default/deps/c-ares/ares_strcasecmp_1.o
build/default/deps/c-ares/ares_free_string_1.o
build/default/deps/c-ares/ares_options_1.o
build/default/deps/c-ares/ares_send_1.o
build/default/deps/c-ares/ares_parse_txt_reply_1.o
build/default/deps/c-ares/ares_parse_ptr_reply_1.o
build/default/deps/c-ares/ares_nowarn_1.o
build/default/deps/c-ares/ares_search_1.o
build/default/deps/c-ares/ares_gethostbyname_1.o
build/default/deps/c-ares/ares_getsock_1.o
build/default/deps/c-ares/ares__timeval_1.o
build/default/deps/c-ares/inet_ntop_1.o
build/default/deps/c-ares/ares_parse_a_reply_1.o
build/default/deps/c-ares/ares_getopt_1.o
build/default/deps/c-ares/ares__close_sockets_1.o
build/default/deps/c-ares/ares_expand_string_1.o
build/default/deps/c-ares/ares_destroy_1.o
build/default/deps/c-ares/ares_cancel_1.o
build/default/deps/c-ares/ares_parse_aaaa_reply_1.o
build/default/deps/c-ares/ares_parse_ns_reply_1.o
build/default/deps/c-ares/ares_version_1.o
build/default/deps/c-ares/ares__get_hostent_1.o
build/default/deps/c-ares/ares_writev_1.o
build/default/deps/c-ares/ares_expand_name_1.o
build/default/deps/c-ares/ares_free_hostent_1.o
build/default/deps/c-ares/ares_parse_mx_reply_1.o
build/default/deps/c-ares/ares_gethostbyaddr_1.o
build/default/deps/c-ares/ares_query_1.o
build/default/deps/c-ares/ares_data_1.o
build/default/deps/c-ares/ares_init_1.o
build/default/deps/c-ares/ares_timeout_1.o
build/default/deps/c-ares/ares_fds_1.o
build/default/deps/c-ares/inet_net_pton_1.o
build/default/deps/c-ares/ares_strerror_1.o
build/default/deps/c-ares/bitncmp_1.o
build/default/deps/c-ares/ares_getnameinfo_1.o
build/default/deps/c-ares/ares_library_init_1.o
build/default/deps/c-ares/ares_mkquery_1.o
build/default/deps/c-ares/ares_process_1.o
build/default/deps/c-ares/windows_port_1.o
build/default/deps/c-ares/ares_parse_srv_reply_1.o
build/default/deps/c-ares/ares_llist_1.o
build/default/deps/c-ares/ares__read_line_1.o
build/default/deps/c-ares/ares_strdup_1.o -> build/default/node
default/deps/libeio/eio_1.o: In function `eio__sync_file_range':
/OE/angstrom-2008/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build/../deps/libeio/eio.c:918:
warning: warning: sync_file_range is not implemented and will always fail
default/src/node_stdio_4.o: In function `node::OpenPTY(v8::Arguments
const&)':

/OE/angstrom-2008/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build/../src/node_stdio.cc:241:
undefined reference to `openpty'

collect2: ld returned 1 exit status
Waf: Leaving directory
`/OE/angstrom-2008/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build'
koen@dominion:/OE/angstrom-2008$

For angstrom/beagleboard
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNgJVnMkyGM64RGpERAtQxAJ9abFsqUaHdSPeeTaZBGs3bgkuGPQCdGzIT
9PZewAqNEe+yMXrmlWUR79A=
=0QMk
-----END PGP SIGNATURE-----



