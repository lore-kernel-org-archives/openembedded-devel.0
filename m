Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9020.1792580995671669460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UO9lzBZ3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso5842245e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580994; x=1793185794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JeSg2dASjV2NihyTS/gH3/r9IG2pWA8pznTa6mNzcKM=;
        b=UO9lzBZ3bclePxxSGQ7jRKUAmFq6W6Le1rxVkMcM9hYD/9fPQTrkYOKf1xYYC6GiFp
         pTRknqw2hGOYpB/bIvIVp812/KUBykddUx4SqfDqN8hmYu+SAPpyyMa1Vn1yPHFaVrNN
         swFgSdE8sB4Lz3ysgIJ2aq212kIHPV9GkrtkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580994; x=1793185794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeSg2dASjV2NihyTS/gH3/r9IG2pWA8pznTa6mNzcKM=;
        b=ASgW8C9Zg2owC+3u4F6SSuZgc9jsNRV/6a2GoGRc9g1aum/CLT9kwRYSxNXSaLL7PV
         4/5HHzWFzZKMR85FlsshKUMfwR2li/+Yr8ap4b45Coz9bXoefPYVWX/lVWscE7g73wHc
         5XxdyJ2rMm0UZ72IHZssCjOwfzy6jmlrRqpGW98ypiHpsXi7vC9eJBpIsh3Pa4oSJQuN
         QwhjG+ji02U3x4LmpIFRMH9UAfeQ2ZscDjaSLvze27kyfc3RmKVUF6N2IEagQFPIKGlF
         uy6As0vtZ85A/1WcUjV9QEcUIV1IQ3qdTGuSjPvSHNQ4w34frZxFOGM43mOuxjcG875N
         Hcqg==
X-Gm-Message-State: AFq9FYLpDCywajYoGpZInTtpbNuCKGUFBuQmAWbZ/txUZD8iqPQYq+l1
	qCIW2ke11fFVZD5clp9PEnH8CqNKFvgdX4+Rd205YZYQZo/Ih9jf9xq9KEFTecYzfizAJInNkvp
	4Py0/
X-Gm-Gg: AYBFou1eypwV1qYs+EYny/wJn+gdufGdLbEFGgmuG/Alf3WHv+c5tdHl4FIyGeoQMfs
	3jNMlYUO+jfvBRMZC0N6lvifkN4TaC/PAbkMEx1lIqd9TbZDDKicl5Ej6OK4D24pa7ACc8DK8kL
	1fcsK2lqH3Z6nQDmVtFIJCi0t/OWQcpXtqMh/j48W9q1waVIzm3x2sU+smcg6AosPtKV7vP4GGI
	fz7FAff5zNHO7fK8ugRL0m/sSY/LdL085e0WURMHFDDtrdQzvTsrepcxOila6BmDS+e1Nn+ATa5
	W6qowl4577dkKOiiH3YpLvibvx/Q/8VvAMO9QG1RRmI0Z74mC1xT/hrM54AoNWmIz6C7N6LPJYZ
	CTZaDQYkG8Edlg6EkAwAsgWx8NGtdULnhAOuLlmApupHbtcSyXQQVtu/aSbwDy7rRd9fBdk4xg1
	0OEDsMXjOAd2xndAIuimxuXmKzoghTHyi9+gxPbMSOCK4LXP1P1C2NW0Dbsc5ikw+qJ95f8kb5P
	cIEPDS7/ifq+Gr/cj3zoU9LDhiqbuMtRc6VbA5raDgn/w2LpGmkY77o86BPGXhKI8LNDJzY7qhA
	IusM/wsU/4uad5x7NAjnQ42KVTm+SschF0p0iiS1nGLHF5x7mvaBU+cwRQrNSGdMRHSthKacs61
	V2b8RGv5Xv6OhdQ3hnYDhg87enA==
X-Received: by 2002:a05:600d:82c1:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1fdb0a0b7mr38002655e9.17.1792580992042;
        Wed, 21 Oct 2026 04:09:52 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20230ca3esm6930535e9.15.2026.10.21.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:09:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-networkx: Upgrade 3.6.1 -> 3.7
Date: Wed, 21 Oct 2026 14:09:48 +0300
Message-ID: <20261021110948.1945055-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131297
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.7:

Highlights:

- The isomorphism checking suite of tools has been upgraded. The
  VF2++ functions now provide subgraph isomorphism and subgraph
  monomorphism checking.
- Leiden based community detection algorithms are now supported via
  leiden_communities and leiden_partitions. This provides an
  alternative, often improved, community detection algorithm
  compared to the Louvain functions.
- The pygraphviz library is now provided via pip with wheels that
  include the GraphViz binaries. This should make the NetworkX
  interface to pygraphviz easier to use for graph layout and
  rendering.

API Changes:

- Expire random lobster dep.
- API: Expire deprecations of could-be isomorphism aliases.
- Proposal to deprecate bfs_predecessors.
- Change maximal_independent_set to return set instead of list
 .
- Add centroid as alias to barycenter.
- API: Deprecate p2g module.

Enhancements:

- Adding the Tree Optimization in Floyd Warshall.
- Kruskal MST early break for efficiency.
- create new generator that returns a random k-lift of a d-regular
  graph.
- Floyd Warshall: Adding support for weight parameter as a callable.
- [ENH] Flow algorithms: Add support for callable capacity
  parameter.
- fix: add suggestions from #8021 and #8029 to is_aperiodic.
- Improve chordal code readability by removing helper function.
- FEAT: Added basic random walk utilities #8378.
- Implement Constant-Potts Model (for use with Leiden community
  detection).
- The isomorphism checking suite of tools has been upgraded. The
  VF2++ functions now provide subgraph isomorphism and subgraph
  monomorphism checking.
- Adding optional sp arg to closeness_centrality.
- perf: replace built-in sum() with np.sum() in pagerank and katz.
- ENH: Add format parameter to adjacency_matrix.
- Proposal: Add density to nx.describe defaults.
- Add utility to extract faces from PlanarEmbedding.
- Improving views exceptions.
- Optimize _build_paths_from_predecessors stack logic for 30-40%
  speedup.
- EHN: Add nonedge argument to from_numpy_array and complete the
  roundtrip.
- State-of-the-art implementation of Tarjan's algorithm.
- Add description and keywords support to GEXF reader/writer.
- DOC: more barycenter and centroid equivalence.
- ENH: Add Barber's bipartite modularity quality function.
- Leiden based community detection algorithms are now supported via
  leiden_communities and leiden_partitions. This provides an
  alternative, often improved, community detection algorithm
  compared to the Louvain functions.
- ENH: Add Shen's overlapping modularity quality function.
- ENH: leiden test and doc_string improvements.
- Add butterflies() to bipartite cluster module.
- Avoid O(E) lookup in nx.display -issue8639.
- Add HITS algorithm benchmark to benchmark suite.
- Add DAG antichain width.
- escape tuple labels in generate_gml.
- Speed up the residual flow reset in edmonds_karp and simplify the
  minimum_cut partition.
- Avoid building the flow dict in maximum_flow_value.
- ENH: add n_samples parameter to rich_club_coefficient for
  multi-sample averaging.
- Simplifying _build_paths_from_predecessors - 10% faster.
- {label=Highlight} The isomorphism checking suite of tools has
  been upgraded. The ISMAGS symmetry aware isomorphism and subgraph
  isomorphism checking tools now support directed and multigraph
  Graphs. And, now in addition to support for (induced) subgraph
  isomorphisms, they support (non-induced subgraph) monomorphism.
- ENH: adding magnetic_laplacian_matrix.
- ENH: Speed up connectivity checks in random_reference and
  lattice_reference.
- [BUG][PERF] Fix ISMAGS directed matching and monomorphism
  overhead.
- Add: Shrikhande graph.

Bug Fixes:

- Bug: Floyd Warshall: resolved self positive loop bug.
- Bugfix for spring layouts with empty list of fixed nodes.
- Fixed diameter/radius error for null graphs.
- Floyd warshall: raises error if negative cycle is found.
- BUG: fix ISMAGS self-loops error.
- Fix cost function in min_weighted_dominating_set.
- Fix sparse heuristic not applied to diagonal blocks in
  stochastic_block_model.
- BUG: fix SpanningTreeIterator AttributeError when using next()
  directly.
- Fix all_node_cuts: correct Even-Tarjan reduction for Kanevsky's
  algorithm.
- fix multigraph isomorphism tests and fix support in ISMAGS and in
  VF2pp.
- BUG: Make argmap._lazy_compile thread-safe.
- reject out-of-range bytes in graph6/sparse6 decoders.
- Fix: bug with mean degree part of
  geometric_soft_configuration_model.
- Fix k_components losing or truncating k-components.
- Fix ISMAGS ignoring matches when graph has extra node/edge colors
  (gh-8738).
- BUG: reverse the map returned by vf2pp functions.
- BUG: Fix node connectivity and node cuts for digraphs.
- BUG: Use power iteration as the default HITS implementation.
- BUG: group betweenness gives incorrect values for undirected
  connected graph.
- BUG: Group betweenness centrality counts paths incorrectly for
  directed but not strongly connected.
- BUG: Group betweenness skips adjustments if any sigma is zero.
- BUG: Handle KeyErrors in directed not strongly-connected
  group_betweenness_centrality.
- BUG: correct normalization of group betweenness centrality when
  endpoints is true.
- [BUG][PERF] Fix ISMAGS directed matching and monomorphism
  overhead.
- BUG: Fix vf2 handling of isomorphism_iter with isolated subgraph
  nodes.
- fix: handle empty candidate sets in
  ISMAGS.largest_common_subgraph.
- BUG: Hold the graph weakly in cached edge and degree views.

Documentation:

- Improving FP recommendations.
- DOC: add Reporting Views reference page and include in toctree.
- Betweenness documentation definitions should match default
  behavior.
- docs: clarify chordal_cycle_graph degree for multigraph vs simple
  graph.
- DOC: dedup graph setup in fp tutorial cells.
- Clarify decorator usage in backend implementations.
- DOC: Warn that env vars must be set before importing networkx.
- Update PGF/TikZ link.
- Consolidate reportviews documentation.
- Document betweenness normalizations correctly.
- DOC: Add nx-guides cross-link to plot_lca example.
- DOC: Update link to football data.
- Clarify that bfs_predecessors() does not actually search through
  predecessors.
- Add example to filter multiedges in edge_subgraph docstring.
- Doc: Add nx_pydot to DOT file documentation.
- Adopt scikit-learn's agentic AI policy.
- Clarify a note on graph ordering in graph_atlas_g docstring.
- DOC: Update import convention for bipartite docstring examples.
- DOC: Use dict(G.degree) in examples.
- Fix typo: thrid-party to third-party in tutorial.
- Fix: minor typo in docstring.
- DOC: Add docstring examples to random_walk.
- DOC: first step to add football.zip to examples directory.
- DOC: Add football example using url to our own examples github
  folder.
- DOC: Remove Good First Issue references from docs.
- DOC: Add note about from_scipy_sparse_array treating zeros as
  explicit zeros.
- Update maximal_independent_set docstring.
- Add examples to degree_histogram docstring.
- Gallery: Fix and update basic_properties example.
- Added example for SpanningTreeIterator to find min spanning trees.
- Gallery: Update basic read/write example.
- Gallery: split simple graph example into two separate ones.
- Fix broken links in quotient_graph docstring and other minor doc
  warnings.
- Gallery: Improve plot_dag example.
- Gallery: Improve plot_degree_sequence example.
- Enhance has_cycle docstring with usage examples.
- DOC: Remove redundant sphinx links.
- DOC: clarify lazy exception behavior in topological_sort
  generator.
- Fixed incorrect description of modularity formula for directed
  graphs.
- DOC: clarify remaining readwrite generator docstrings.
- DOC: Add note about connectionstyle effectiveness.
- DOC: more barycenter and centroid equivalence.
- DOC: Add xref to nx-guides to gallery overview.
- DOC: Add conference information to visualization in football
  example.
- leiden: fix "wen" + duplicate "the the" in q_add comment.
- Fix star graph node count in dual_barabasi_albert_graph comment.
- DOC: update to roadmap.
- DOC: Clarify degree_centrality behavior for directed graphs.
- DOC: Fixups for Leiden docstrings.
- DOC: Update install guide.
- Louvain updates to docs and code readability.
- DOC: Add Hiveplotlib to Drawing Docs and External Examples
  Gallery.
- Clarify attribute behavior in relabel_nodes when multiple nodes
  map to the same target.
- MAINT: update code of conduct form link to match NumFOCUS link.
- Warn when PageRank convergence check is ineffective.
- DOC: fix lattice_reference niter default (5, not 1).
- Fix typos in comments and docstrings.
- DOC: Add example of floating point handling for maximum_flow
  capacity.
- DOC: minor tweaks to biconnected docstring examples.
- BUG: fix bfs_successors yielding empty tuple for zero-successor
  source.
- DOC: clarify method='unweighted' behavior in all_shortest_paths
  helpers.
- Fix docstring parameters that are not in the signature.
- Raise NetworkXError on unknown attribute class in GEXF reader.
- DOC: add example of immediate post-dominators.
- Fix four docstring parameter names that do not match the
  signature.
- DOC: Add details about steiner tree approxmation for disconnected
  graphs.
- DOC: Fix broken link in leiden_partitions.
- DOC: Fixup communicability.
- DOC: document bfs_layout raises.
- Add and correct ISMAGS method docs.
- DOC: Fix write graphml docstring examples.
- DOC: Fix edgelist docstring examples.
- DOC: Fix TeX docstring examples.
- DOC: Fixing adjlist docstring examples.
- DOC: Fix gexf docstring examples.
- DOC: Fixing bipartite.write_edgelist docstring examples.
- DOC: Fix pajek docstring examples.
- DOC: Update bipartite.read_edgelist docstring examples.
- DOC: Fix multiadjlist docstring examples.
- DOC: Fix gml docstring examples.
- [BUG][PERF] Fix ISMAGS directed matching and monomorphism
  overhead.
- DOC: Fix Parameters indentation in generate_gexf.
- Expose *Matcher classes to get them into the objects inventory.

Maintenance:

- Relaxes check for undirected edge node ordering when backends are
  used for networkx tests.
- Revert "pin python 3.14 to be version 3.14.0 until dataclasses
  are fixed".
- MAINT: Single implementation for different returns.
- CI: Build docs in parallel.
- BENCH: Add minimum spanning tree to benchmarks.
- fix: circular_ladder_graph edge cases for n < 2.
- Fix/refactor dag root to leaf.
- fix: preserve string positions in to_agraph conversion.
- BUG: forceatlas2 layout with nonarray complete initial positions.
- Add benchmarks for is_chordal.
- Explicitly install nx after deps.
- Minor improvements to chordal_graph_treewidth.
- DOC: Eliminate sphinx build warnings.
- CI: Bump dispatch workflow python version.
- Update minimum dependencies (SPEC 0) and drop python 3.11.
- Remove _hits_scipy code that has been deprecated.
- DOC: footnote -> hyperlink.
- Linting exceptions.
- BUGFIX: spring energy and ARF layouts with zero iterations.
- Expire random lobster dep.
- MAINT: Reuse could_be_isomorphic in fast_/faster_ variants.
- API: Expire deprecations of could-be isomorphism aliases.
- MAINT: Bump linters.
- CI: Use pixi for CI platform/OS independent tasks.
- CI: Explicitly add pip as a dep while resolving doc env.
- Minor random_walks test refactor.
- Refactor random walk implementation.
- Minor update to zip examples.
- TST: Dedup and refactor closeness centrality tests.
- MAINT: clarify error when RandomState is used with random API.
- MAINT: remove unused functions and imports.
- MAINT: Minor readability tweaks to pagerank.
- Raise ValueError in write_gexf for mixed typed attributes.
- BUG: Handle small graphs in information_centrality.
- CI: fix benchmark PR workflow checkout.
- Followup that fixes import order.
- MAINT: remove unused imports and dead helpers.
- MAINT: Handle insufficient degree Pearson samples.
- Optimize VF2 GMState frontier update by removing full core scan.
- MAINT: Avoid subgraph views in strategy_connected_sequential.
- Cleanup butterflies tests.
- Remove unused dsum variable from havel_hakimi_graph.
- CI: networkx default deps were leaking into the pixi default env.
- DOC/CI: Update github label requirements for user experience.
- CI: Redo benchmarks to use pixi around asv.
- MAINT: Fix ci permissions.
- MAINT: Minor touchups to lexicographical_toplogical_sort.
- MAINT: Rm MANIFEST.in.
- CI: Add image comparison tests to pre-release workflows.
- MAINT: Avoid subgraph views in is_forest.
- TST, MAINT: explict graphviz check for test_pydot.
- CI: Fix circleci artifact redirector permissions.
- write xsd:boolean true/false for dynamic gexf attvalues.
- escape quotes and backslashes in pajek make_qstr.
- Louvain updates to docs and code readability.
- Align boruvka_mst_edges keys default with kruskal/prim and fix
  docstring typo.
- TST: Test maintenance for test_clique.py.
- Optimize Leiden data handling.
- MAINT: Avoid Louvain infinite loops.
- MAINT: avoid timeouts on circleci.
- MAINT: bump copyright year before release.
- BENCH: Add clustering to algorithm benchmarks.
- CI: Add back --doctest-modules flag to base tests.
- Prune nested components in k_components reconstruction and add
  tests the private helpers.
- Fix reverse to preserve all attributes in dispatch conversions.
- Clear the dispatch cache in remove_{node,edge}_attributes.
- Fix "accidentally quadratic" use of list as queue in
  full_rary_tree.
- MAINT: allow isomorphism match helpers to be lists or not.
- fix: correct typo in test variable name.
- Allow spectral_layout to handle dim>=len(G). Added dim tests.
- META: Add agents.md.
- MNT: Use linalg.eigh to compute HITS eigenvalues.
- TST: parameterizing with iterables is deprecated in pytest.
- TST: Cleanup & modernize the minimum cuts test suite.
- MAINT: Refactor communicability tests.
- ENH: Use linear algebra to compute communicability.
- MNT: Raise warnings to errors while running pytest.
- MAINT: sparse.eye is deprecated, use eye_array.
- BUG: Fix _hits_numpy inf/NaN when eigh returns negated
  eigenvector.
- Fix typo while dispatching vf2pp.
- Support for Py3.15.
- Update minimum dependencies (SPEC 0).

Other:

- TST: Common tests for all isomorphism algorithms.
- TST: Add test cases for len(G) != 3.
- TST: shorten leiden tests.
- TST: Update pytest-mpl baselines for matplotlib v3.11.
- Adding regression test for duplicate shortest-paths.

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_3.6.1.bb => python3-networkx_3.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.6.1.bb => python3-networkx_3.7.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb b/meta-python/recipes-devtools/python/python3-networkx_3.7.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.7.bb
index fe08ae9968..856e2809f3 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.7.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7592b173aee2da0e062f9cfa0378e9d"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ccf59069a708419c8b37163831a4228"
 
-SRC_URI[sha256sum] = "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
+SRC_URI[sha256sum] = "fd77a511bd90f39f3d016351345b52cf5319b813bdca01de3f755d3cca62e96a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

